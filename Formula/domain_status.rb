class DomainStatus < Formula
  desc "Concurrent URL status checker that captures comprehensive metadata in SQLite"
  homepage "https://github.com/alexwoolford/domain_status"
  version "0.1.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.13/domain_status-macos-aarch64.tar.gz"
      sha256 "e4bab29262e23d5d2e6590340f42238fdc347eaa2d7d786e91eaae562801ee18"
    else
      url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.13/domain_status-macos-x86_64.tar.gz"
      sha256 "266fa1554c59b883f23aee2892288e84b7bddb0f68dcff8fae7eade3c34dc993"
    end
  end

  on_linux do
    url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.13/domain_status-linux-x86_64.tar.gz"
    sha256 "8eecca23fda06106bb715847e787e9de8dba6b07eb3b46e8e5d8b077aa570106"
  end

  def install
    bin.install "domain_status"
  end

  test do
    assert_match "domain_status", shell_output("#{bin}/domain_status --version")
  end
end
