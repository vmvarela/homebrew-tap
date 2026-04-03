class Takeoff < Formula
  desc "Release automation for Zig projects"
  homepage "https://github.com/vmvarela/takeoff"
  url "https://github.com/vmvarela/takeoff/releases/download/v0.4.0/takeoff-v0.4.0-macos-aarch64.tar.gz"
  sha256 "19d68cb965d4642e77abd7143b84ce273e53f80e6e68e3127375979135d9b0f0"
  version "0.4.0"
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
