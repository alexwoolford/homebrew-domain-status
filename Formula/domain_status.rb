class DomainStatus < Formula
  desc "Concurrent URL status checker that captures comprehensive metadata in SQLite"
  homepage "https://github.com/alexwoolford/domain_status"
  version "0.1.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.21/domain_status-macos-aarch64.tar.gz"
      sha256 "009ca0427da84ea301e168b9fcabae43fa260301435745f38c8e5f284e10afdb"
    else
      url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.21/domain_status-macos-x86_64.tar.gz"
      sha256 "7b7c096c4dbf914c2bdf0e0f40edbf10cf0286bed83b86f7023d6bec17f3d54b"
    end
  end

  on_linux do
    url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.21/domain_status-linux-x86_64.tar.gz"
    sha256 "606a906cf43d73594aac0fa5450a9b9496e26f462dd731f9d1ecfcb3094427b3"
  end

  def install
    bin.install "domain_status"
  end

  test do
    assert_match "domain_status", shell_output("\#{bin}/domain_status --version")
  end
end
