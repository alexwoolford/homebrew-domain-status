class DomainStatus < Formula
  desc "Concurrent URL status checker that captures comprehensive metadata in SQLite"
  homepage "https://github.com/alexwoolford/domain_status"
  version "0.1.25"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.25/domain_status-macos-aarch64.tar.gz"
      sha256 "7b7965683e927b591b72f33bba8bfcc20e8c983420afd7a71ea21586b021e63f"
    else
      url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.25/domain_status-macos-x86_64.tar.gz"
      sha256 "fa1d6d33219972afeb94fbe7b1e7189e7a084e27b37608f26adafca067968047"
    end
  end

  on_linux do
    url "https://github.com/alexwoolford/domain_status/releases/download/v0.1.25/domain_status-linux-x86_64.tar.gz"
    sha256 "989e25e2b4e8e33caadbc4735d602fb66910d54f94a32b6120c52f32fdf5918e"
  end

  def install
    bin.install "domain_status"
  end

  test do
    assert_match "domain_status", shell_output("\#{bin}/domain_status --version")
  end
end
