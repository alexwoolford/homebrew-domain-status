class DomainStatus < Formula
  desc "Concurrent URL status checker that captures comprehensive metadata in SQLite"
  homepage "https://github.com/alexwoolford/domain_status"
  version "0.1.20"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.20/domain_status-macos-aarch64.tar.gz"
      sha256 "9189a46932e12909ec7080d68f92783cd0925282dd801351ecb7a05057d4eb9f"
    else
      url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.20/domain_status-macos-x86_64.tar.gz"
      sha256 "8647dacadfae5dc8b65999282e2618f89ef3fe79884cda274ba7c770e4ba1cd1"
    end
  end

  on_linux do
    url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.20/domain_status-linux-x86_64.tar.gz"
    sha256 "151bacdc51a2c269fb8a38ed7a58e31922a066348ba67c46b7297692c47b68d8"
  end

  def install
    bin.install "domain_status"
  end

  test do
    assert_match "domain_status", shell_output("\#{bin}/domain_status --version")
  end
end
