class Takeoff < Formula
  desc "Release automation for Zig projects"
  homepage "https://github.com/vmvarela/takeoff"
  url "https://github.com/vmvarela/takeoff/releases/download/v0.2.0/takeoff-v0.2.0-4-gfebd30c-macos-aarch64.tar.gz"
  sha256 "817a6dcbc2d4d82b9965f3690ad14bd1c8f2aad61e8f4797d3f78b60419818ef"
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
