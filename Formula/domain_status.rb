class DomainStatus < Formula
  desc "Concurrent URL status checker that captures comprehensive metadata in SQLite"
  homepage "https://github.com/alexwoolford/domain_status"
  version "0.1.23"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.23/domain_status-macos-aarch64.tar.gz"
      sha256 "dfaf063d7f7cba0f1b56a4bd69ddd3d2a845d76659787215cf4b8f20b3f9972c"
    else
      url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.23/domain_status-macos-x86_64.tar.gz"
      sha256 "4c8237986c241563d41b4dbcf2dccee2936e3243ce01fab86bb2c258793b74a4"
    end
  end

  on_linux do
    url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.23/domain_status-linux-x86_64.tar.gz"
    sha256 "f6e4aa580af399b107c5f11fff139d6a355e0a7f92a1543ea80ba81fec3e7494"
  end

  def install
    bin.install "domain_status"
  end

  test do
    assert_match "domain_status", shell_output("\#{bin}/domain_status --version")
  end
end
