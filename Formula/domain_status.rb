class DomainStatus < Formula
  desc "Concurrent URL status checker that captures comprehensive metadata in SQLite"
  homepage "https://github.com/alexwoolford/domain_status"
  version "0.1.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.12/domain_status-macos-aarch64.tar.gz"
      sha256 "bfd8440145e5be4ec307f0d6e8ca1b11a906bd054e1ced5ea2a1a0fdf426c151"
    else
      url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.12/domain_status-macos-x86_64.tar.gz"
      sha256 "1d9f0feb321f0a0d3eedf73b9c79fb86215472a656650d268c78efb7f9ca2f3d"
    end
  end

  on_linux do
    url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.12/domain_status-linux-x86_64.tar.gz"
    sha256 "5a032ab3db1f8e71c7c60a9c974d1247188fd539f508ad3aecf4538255e93a09"
  end

  def install
    bin.install "domain_status"
  end

  test do
    assert_match "domain_status", shell_output("#{bin}/domain_status --version")
  end
end
