class Takeoff < Formula
  desc "Release automation for Zig projects"
  homepage "https://github.com/vmvarela/takeoff"
  url "https://github.com/vmvarela/takeoff/releases/download/v0.2.0/takeoff-v0.2.0-1-gf21d19e-macos-aarch64.tar.gz"
  sha256 "edfdf4d13801261c421ec9f4d0a8677c625338f1a3db3bd7e172aac8b1641ebe"
  license "MIT"

  head "https://github.com/vmvarela/takeoff.git"

  depends_on :macos

  def install
    bin.install "bin/takeoff"

  end

  test do
    system bin/"takeoff", "--version"
  end
end
