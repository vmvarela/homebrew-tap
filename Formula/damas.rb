class Damas < Formula
  desc "Checkers game: CLI, TUI and embedded web server in one binary"
  homepage "https://github.com/vmvarela/damas"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vmvarela/damas/releases/download/v0.1.1/damas-aarch64-macos"
      sha256 "10e73bd37aea8a17e26d031a50ca9acb3d5d1637d88958075d5ccfa07483d289"
    end
    on_intel do
      url "https://github.com/vmvarela/damas/releases/download/v0.1.1/damas-x86_64-macos"
      sha256 "f117dbff9b079b012f7c778ac2ebc97301fbd7e29d2bd974dc5521e35f9ce846"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vmvarela/damas/releases/download/v0.1.1/damas-aarch64-linux"
      sha256 "9835ba82ac1235fad2a19f8c81ba224a0d5bd0d8986827c8e9e1170f0cdd9b65"
    end
    on_intel do
      url "https://github.com/vmvarela/damas/releases/download/v0.1.1/damas-x86_64-linux"
      sha256 "f6764a9f97c2cd9132c5fb00a1e79cf1b65e3d93e95429a91bac7968210308b6"
    end
  end

  def install
    bin.install Dir["damas*"].first => "damas"
  end

  test do
    assert_match "damas", shell_output("#{bin}/damas --version 2>&1")
  end
end
