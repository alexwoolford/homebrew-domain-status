#!/usr/bin/env bash
# Update Formula/domain-status.rb with version, URLs, and SHA256 from GitHub release.
# Usage: ./scripts/update-formula.sh 0.2.0
set -euo pipefail
VERSION="${1:?Usage: $0 VERSION (e.g. 0.2.0)}"
REPO="alexwoolford/domain-status"
API="https://api.github.com/repos/${REPO}/releases/tags/v${VERSION}"
FORMULA="Formula/domain-status.rb"

echo "Fetching release v${VERSION}..."
resp=$(curl -sS "$API")
if echo "$resp" | jq -e '.message == "Not Found"' >/dev/null 2>&1; then
  echo "Release v${VERSION} not found. Create and push tag v${VERSION} first and wait for the workflow to finish." >&2
  exit 1
fi

get_sha() {
  echo "$resp" | jq -r --arg name "$1" '.assets[] | select(.name == $name) | .digest | sub("^sha256:"; "")'
}
sha_macos_arm=$(get_sha "domain-status-macos-aarch64.tar.gz")
sha_macos_x64=$(get_sha "domain-status-macos-x86_64.tar.gz")
sha_linux=$(get_sha "domain-status-linux-x86_64.tar.gz")

if [[ -z "$sha_macos_arm" || -z "$sha_macos_x64" || -z "$sha_linux" ]]; then
  echo "One or more tarball assets missing in release." >&2
  exit 1
fi

echo "Updating $FORMULA..."
mkdir -p Aliases
echo "domain-status" > Aliases/domain_status
cat > "$FORMULA" << RUBY
class DomainStatus < Formula
  desc "Concurrent URL status checker that captures comprehensive metadata in SQLite"
  homepage "https://github.com/${REPO}"
  version "${VERSION}"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/${REPO}/releases/download/v${VERSION}/domain-status-macos-aarch64.tar.gz"
      sha256 "${sha_macos_arm}"
    else
      url "https://github.com/${REPO}/releases/download/v${VERSION}/domain-status-macos-x86_64.tar.gz"
      sha256 "${sha_macos_x64}"
    end
  end

  on_linux do
    url "https://github.com/${REPO}/releases/download/v${VERSION}/domain-status-linux-x86_64.tar.gz"
    sha256 "${sha_linux}"
  end

  def install
    bin.install "domain-status"
    bin.install_symlink "domain-status" => "domain_status"
  end

  test do
    assert_match "domain-status", shell_output("#{bin}/domain-status --version")
  end
end
RUBY
echo "Done. Review with: git diff $FORMULA"
echo "Then: git add $FORMULA Aliases/domain_status && git commit -m 'Release domain-status ${VERSION}' && git push origin main"
