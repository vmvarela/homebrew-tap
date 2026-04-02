class Takeoff < Formula
  desc "Release automation for Zig projects"
  homepage "https://github.com/vmvarela/takeoff"
  url "https://github.com/vmvarela/takeoff/releases/download/v0.3.0-1-g289affa/takeoff-v0.3.0-macos-aarch64.tar.gz"
  sha256 "2fb23ea2a3754a6e022c14433caa3b07a72bd9d81c66337bdb4c0f07e7eb7f58"
  version "0.3.0-1-g289affa"
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
