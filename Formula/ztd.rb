class Ztd < Formula
  desc "Local task system for humans and agents"
  homepage "https://github.com/vmvarela/ztd"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vmvarela/ztd/releases/download/v0.4.1/ztd-aarch64-macos"
      sha256 "1302228fec6ac3b25f1e2c55fce5911ea4ce9400c4722c26463c6c23a729e066"
    end
    on_intel do
      url "https://github.com/vmvarela/ztd/releases/download/v0.4.1/ztd-x86_64-macos"
      sha256 "13fb55992b8d4c601935dd04337226815f101e10c0d11a5f66bd01e79d0acfcd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vmvarela/ztd/releases/download/v0.4.1/ztd-aarch64-linux"
      sha256 "295bf86f43b21f8eb13cde04cd909893474dde0cb90ab5d1fb98ec1a998daeee"
    end
    on_intel do
      url "https://github.com/vmvarela/ztd/releases/download/v0.4.1/ztd-x86_64-linux"
      sha256 "40a8ef206696110db0016c358decce0c7edede977cb3217a31224e2b446321e5"
    end
  end

  resource "man" do
    url "https://github.com/vmvarela/ztd/releases/download/v0.4.1/ztd.1.gz"
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
