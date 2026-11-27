class Ztd < Formula
  desc "Local task system for humans and agents"
  homepage "https://github.com/vmvarela/ztd"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vmvarela/ztd/releases/download/v0.4.0/ztd-aarch64-macos"
      sha256 "c6380d95a86a984df9d57755fb3dddabe81087db179807c68f52528b3a4a6659"
    end
    on_intel do
      url "https://github.com/vmvarela/ztd/releases/download/v0.4.0/ztd-x86_64-macos"
      sha256 "c3ddbe9bce15d2c101c174cc5fde22f0083a196f19a4536d10b8480ebf36a26d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vmvarela/ztd/releases/download/v0.4.0/ztd-aarch64-linux"
      sha256 "6e04d659941f886db45ef9e57d88f3059225e2d593e1e6d65154934685f83393"
    end
    on_intel do
      url "https://github.com/vmvarela/ztd/releases/download/v0.4.0/ztd-x86_64-linux"
      sha256 "8fe024547b1f46b410d136444f15d55a6e40e2a148e791ac831e28b65508466e"
    end
  end

  resource "man" do
    url "https://github.com/vmvarela/ztd/releases/download/v0.4.0/ztd.1.gz"
    sha256 "f84d914bbb9c67b78505bc269fd52028557f04336dba190f9d4e48030e6b1b95"
  end

  def install
    bin.install Dir["ztd*"].first => "ztd"
    resource("man").stage do
      man1.install Dir["ztd.1*"].first
    end
  end

  test do
    assert_match "version", shell_output("#{bin}/ztd version 2>&1")
  end
end
