class DomainStatus < Formula
  desc "Concurrent URL status checker that captures comprehensive metadata in SQLite"
  homepage "https://github.com/alexwoolford/domain_status"
  version "0.1.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.19/domain_status-macos-aarch64.tar.gz"
      sha256 "7c3e6ddfda6bb51b800ef4de9c0a7ef2df2f93a1492f7fec70580211e1c97c66"
    else
      url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.19/domain_status-macos-x86_64.tar.gz"
      sha256 "64ed4d20c766ce46ecbc3db15420cb7a5d54156c397653e47a3a139f3a583706"
    end
  end

  on_linux do
    url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.19/domain_status-linux-x86_64.tar.gz"
    sha256 "8b50f4fa4951078c92d0cee48117958cf48d90038321b28cf2eb2b6af67e7740"
  end

  def install
    bin.install "domain_status"
  end

  test do
    assert_match "domain_status", shell_output("\#{bin}/domain_status --version")
  end
end
