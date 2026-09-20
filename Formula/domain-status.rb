class DomainStatus < Formula
  desc "Concurrent URL status checker that captures comprehensive metadata in SQLite"
  homepage "https://github.com/alexwoolford/domain-status"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/alexwoolford/domain-status/releases/download/v0.2.1/domain-status-macos-aarch64.tar.gz"
      sha256 "22be9d5a1dda02fcdb6b886bbe0facb3a9812b20dca0d23e7e5b920a221def62"
    else
      url "https://github.com/alexwoolford/domain-status/releases/download/v0.2.1/domain-status-macos-x86_64.tar.gz"
      sha256 "dd3223d47fe572cd772d966a4dcf8d27d2616ec6657205c51aeb997eb6baae44"
    end
  end

  on_linux do
    url "https://github.com/alexwoolford/domain-status/releases/download/v0.2.1/domain-status-linux-x86_64.tar.gz"
    sha256 "da1bbd1c79801d66b2ba0a2df940eb1ef2b5b8281468b07698ca032564016782"
  end

  def install
    bin.install "domain-status"
    bin.install_symlink "domain-status" => "domain_status"
  end

  test do
    assert_match "domain-status", shell_output("\#{bin}/domain-status --version")
  end
end
