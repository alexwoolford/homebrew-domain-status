class DomainStatus < Formula
  desc "Concurrent URL status checker that captures comprehensive metadata in SQLite"
  homepage "https://github.com/alexwoolford/domain_status"
  version "0.1.26"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.26/domain_status-macos-aarch64.tar.gz"
      sha256 "8c1722f17074da443cc6aad5fe8ac6247aa5ade7915781499635237635bf7f17"
    else
      url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.26/domain_status-macos-x86_64.tar.gz"
      sha256 "64b6325a24f000761ca09f3292dd8329b0d3e898bcfefcd6246a99c00b9542e0"
    end
  end

  on_linux do
    url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.26/domain_status-linux-x86_64.tar.gz"
    sha256 "0d46f2130e23ef18b154b0f8df2624b2521bc1ff320870a9dab2537e8ce6745c"
  end

  def install
    bin.install "domain_status"
  end

  test do
    assert_match "domain_status", shell_output("\#{bin}/domain_status --version")
  end
end
