class Takeoff < Formula
  desc "Release automation for Zig projects"
  homepage "https://github.com/vmvarela/takeoff"
  url "https://github.com/vmvarela/takeoff/releases/download/v0.4.1/takeoff-v0.4.1-macos-aarch64.tar.gz"
  sha256 "6c4fc5e666a380f43d5e2b0e56aeb77b4724aef3746c07fc9671b137bda90c9f"
  version "0.4.1"
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
