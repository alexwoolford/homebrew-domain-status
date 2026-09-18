class DomainStatus < Formula
  desc "Concurrent URL status checker that captures comprehensive metadata in SQLite"
  homepage "https://github.com/alexwoolford/domain-status"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/alexwoolford/domain-status/releases/download/v0.2.0/domain-status-macos-aarch64.tar.gz"
      sha256 "de1ff877cf89ffeb1e7e976bf4842e91b8d7870d65c492a58edce77fcd2863d1"
    else
      url "https://github.com/alexwoolford/domain-status/releases/download/v0.2.0/domain-status-macos-x86_64.tar.gz"
      sha256 "01feceeac2beaf1faa219d98d7e298df3a00f070b277ca140b6c9ce554a87b4c"
    end
  end

  on_linux do
    url "https://github.com/alexwoolford/domain-status/releases/download/v0.2.0/domain-status-linux-x86_64.tar.gz"
    sha256 "750fa773f67c0db91e9a7037a0ec24cc672b4b6745f64be0f8aa7fe26f353c8d"
  end

  def install
    bin.install "domain-status"
    bin.install_symlink "domain-status" => "domain_status"
  end

  test do
    assert_match "domain-status", shell_output("\#{bin}/domain-status --version")
  end
end
