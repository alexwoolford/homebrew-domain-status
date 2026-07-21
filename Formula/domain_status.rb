class DomainStatus < Formula
  desc "Concurrent URL status checker that captures comprehensive metadata in SQLite"
  homepage "https://github.com/alexwoolford/domain_status"
  version "0.1.22"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.22/domain_status-macos-aarch64.tar.gz"
      sha256 "f9e5cfc24739e042f29ba062eeccc28f41127629e599bd0642cdd4ba55c6fd22"
    else
      url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.22/domain_status-macos-x86_64.tar.gz"
      sha256 "0a06cb4e342191974267edc752c59731730f1d591fdb5a04d506bf7e232c0108"
    end
  end

  on_linux do
    url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.22/domain_status-linux-x86_64.tar.gz"
    sha256 "7f53d3633e950c2695fe6af26d4b7e58deedd867b7c3aa2bcc0d7635b68f30ea"
  end

  def install
    bin.install "domain_status"
  end

  test do
    assert_match "domain_status", shell_output("#{bin}/domain_status --version")
  end
end
