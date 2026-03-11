class DomainStatus < Formula
  desc "Concurrent URL status checker that captures comprehensive metadata in SQLite"
  homepage "https://github.com/alexwoolford/domain_status"
  version "0.1.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.18/domain_status-macos-aarch64.tar.gz"
      sha256 "4e01e1f8c65e152786be785b906f30da49cbbbe9a7f22ffe44b11ee068e6746b"
    else
      url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.18/domain_status-macos-x86_64.tar.gz"
      sha256 "caf2c9cf9433dd743470664ffa54cd2db515ac12fb002243fe58bbcddc249138"
    end
  end

  on_linux do
    url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.18/domain_status-linux-x86_64.tar.gz"
    sha256 "5bdad72488f46cc7eb990ec2233494e1accf478645af472808b6b6374d06e7c6"
  end

  def install
    bin.install "domain_status"
  end

  test do
    assert_match "domain_status", shell_output("\#{bin}/domain_status --version")
  end
end
