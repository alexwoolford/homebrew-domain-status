class DomainStatus < Formula
  desc "Concurrent URL status checker that captures comprehensive metadata in SQLite"
  homepage "https://github.com/alexwoolford/domain_status"
  version "0.1.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.16/domain_status-macos-aarch64.tar.gz"
      sha256 "c593b7efb740523afc4ec8e2cb142dffd11721af088b924ae8ebe6e1244ffd00"
    else
      url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.16/domain_status-macos-x86_64.tar.gz"
      sha256 "94bdd8153e415588221f5bc10011cd04ba4a836bb30a7336e83bb8366d4328ce"
    end
  end

  on_linux do
    url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.16/domain_status-linux-x86_64.tar.gz"
    sha256 "61372936ac7c5046f160fd57cbc652604954a0e1a3a4024c25ba8a7e2cc3b8ef"
  end

  def install
    bin.install "domain_status"
  end

  test do
    assert_match "domain_status", shell_output("\#{bin}/domain_status --version")
  end
end
