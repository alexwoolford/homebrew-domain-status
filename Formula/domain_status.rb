class DomainStatus < Formula
  desc "Concurrent URL status checker that captures comprehensive metadata in SQLite"
  homepage "https://github.com/alexwoolford/domain_status"
  version "0.1.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.17/domain_status-macos-aarch64.tar.gz"
      sha256 "2caeaab7dae054844651757d9b7fdda17f4585798677c41aea1f301ad003d961"
    else
      url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.17/domain_status-macos-x86_64.tar.gz"
      sha256 "d1539a060d324839b39ec450a32dd39fbaf593cbfa9ee4e0e28ac4d3162f755d"
    end
  end

  on_linux do
    url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.17/domain_status-linux-x86_64.tar.gz"
    sha256 "6b774cec3d5071b52ab2a8bb7f16265e99abd30fd751a3c051d42a2cc8a4b570"
  end

  def install
    bin.install "domain_status"
  end

  test do
    assert_match "domain_status", shell_output("\#{bin}/domain_status --version")
  end
end
