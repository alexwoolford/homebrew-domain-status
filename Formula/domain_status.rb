class DomainStatus < Formula
  desc "Concurrent URL status checker that captures comprehensive metadata in SQLite"
  homepage "https://github.com/alexwoolford/domain_status"
  version "0.1.24"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.24/domain_status-macos-aarch64.tar.gz"
      sha256 "26fdc1268e98c94d4a42efbde20a4d0fe3c598a14c32c3c24ea30459df778a36"
    else
      url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.24/domain_status-macos-x86_64.tar.gz"
      sha256 "4f471daf5ac551fa2f027f2f0cfc87baf2c22fb6ece8ba20f1ebe51538aaa319"
    end
  end

  on_linux do
    url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.24/domain_status-linux-x86_64.tar.gz"
    sha256 "06e2cd9be9242d0aef63ce7d8016caf57bc0e5fac5451bd682a8eca37befaf7e"
  end

  def install
    bin.install "domain_status"
  end

  test do
    assert_match "domain_status", shell_output("\#{bin}/domain_status --version")
  end
end
