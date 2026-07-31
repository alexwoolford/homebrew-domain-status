class DomainStatus < Formula
  desc "Concurrent URL status checker that captures comprehensive metadata in SQLite"
  homepage "https://github.com/alexwoolford/domain_status"
  version "0.1.27"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.27/domain_status-macos-aarch64.tar.gz"
      sha256 "ef7dcfb278c85103a6ba06a3338b80bbc816eeee3174994a63cec41a9cfa6639"
    else
      url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.27/domain_status-macos-x86_64.tar.gz"
      sha256 "7315901dccb1fe2bf614c549bbb3e40c1b742bebcbef9d5de31a1be245f2592f"
    end
  end

  on_linux do
    url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.27/domain_status-linux-x86_64.tar.gz"
    sha256 "3368a02afa28b788bf1855c6b14609b8ddb5814cad3f4a91a01d9aa7c492cd9a"
  end

  def install
    bin.install "domain_status"
  end

  test do
    assert_match "domain_status", shell_output("\#{bin}/domain_status --version")
  end
end
