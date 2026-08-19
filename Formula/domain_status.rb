class DomainStatus < Formula
  desc "Concurrent URL status checker that captures comprehensive metadata in SQLite"
  homepage "https://github.com/alexwoolford/domain_status"
  version "0.1.28"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.28/domain_status-macos-aarch64.tar.gz"
      sha256 "a519620c3ebc5e7a9934722255d14c6e967a2ccb0b26a630176cb2751a8e033e"
    else
      url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.28/domain_status-macos-x86_64.tar.gz"
      sha256 "279d6d7af599995392946a8f090b03c97fc23a9e4df4746f84ae4d166cd2b025"
    end
  end

  on_linux do
    url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.28/domain_status-linux-x86_64.tar.gz"
    sha256 "153c17700993727c613ec2f02cd7f339694f63658db119f7ec68d480905532bf"
  end

  def install
    bin.install "domain_status"
  end

  test do
    assert_match "domain_status", shell_output("\#{bin}/domain_status --version")
  end
end
