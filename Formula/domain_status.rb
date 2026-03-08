class DomainStatus < Formula
  desc "Concurrent URL status checker that captures comprehensive metadata in SQLite"
  homepage "https://github.com/alexwoolford/domain_status"
  version "0.1.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.14/domain_status-macos-aarch64.tar.gz"
      sha256 "9297c29971334ec13a7a08b08c2da895b610cef06c41dc7ef7a5186d585d229b"
    else
      url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.14/domain_status-macos-x86_64.tar.gz"
      sha256 "cafb452c1469207abf1b72e376c400d100decda67c152b5e665762118b98916a"
    end
  end

  on_linux do
    url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.14/domain_status-linux-x86_64.tar.gz"
    sha256 "2a1f717d3911729fc9fa4884d83411bac3864f8b10cb8f557a1bba4fad43ffe5"
  end

  def install
    bin.install "domain_status"
  end

  test do
    assert_match "domain_status", shell_output("#{bin}/domain_status --version")
  end
end
