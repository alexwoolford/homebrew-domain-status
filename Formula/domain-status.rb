class DomainStatus < Formula
  desc "Concurrent URL status checker that captures comprehensive metadata in SQLite"
  homepage "https://github.com/alexwoolford/domain-status"
  version "0.1.29"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/alexwoolford/domain-status/releases/download/v0.1.29/domain_status-macos-aarch64.tar.gz"
      sha256 "6cd3f83f9feae8e383f55ab63da72b3a8915987d400c8a97fdae46a9f0f67950"
    else
      url "https://github.com/alexwoolford/domain-status/releases/download/v0.1.29/domain_status-macos-x86_64.tar.gz"
      sha256 "71e47c3f2b582650337551abed7d7823875dc7bd1500c405a10fb5c76cf8babf"
    end
  end

  on_linux do
    url "https://github.com/alexwoolford/domain-status/releases/download/v0.1.29/domain_status-linux-x86_64.tar.gz"
    sha256 "8cecf6d6341ac3a5a4175b94de5c1138fc7c23684f53a6250ec63dca3a327d08"
  end

  def install
    bin.install "domain_status"
    bin.install_symlink "domain_status" => "domain-status"
  end

  test do
    assert_match "domain_status", shell_output("#{bin}/domain_status --version")
    assert_match "domain_status", shell_output("#{bin}/domain-status --version")
  end
end
