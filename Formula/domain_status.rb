class DomainStatus < Formula
  desc "Concurrent URL status checker that captures comprehensive metadata in SQLite"
  homepage "https://github.com/alexwoolford/domain_status"
  version "0.1.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.15/domain_status-macos-aarch64.tar.gz"
      sha256 "c040111b6aa617d702f35c684758ec9f95d139af0b4e1d7facd8cc37baeddcd4"
    else
      url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.15/domain_status-macos-x86_64.tar.gz"
      sha256 "ff0ab762f805d486b690bc6e06eb83251645abe027aa6cd250b44816c8bd40e5"
    end
  end

  on_linux do
    url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.15/domain_status-linux-x86_64.tar.gz"
    sha256 "656e0f1248c94d55ca2858b3375c3e35b99577d5ac9ca2ba84b49393014d5fbd"
  end

  def install
    bin.install "domain_status"
  end

  test do
    assert_match "domain_status", shell_output("\#{bin}/domain_status --version")
  end
end
