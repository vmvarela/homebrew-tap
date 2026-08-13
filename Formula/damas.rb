class Damas < Formula
  desc "Checkers game: CLI, TUI and embedded web server in one binary"
  homepage "https://github.com/vmvarela/damas"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vmvarela/damas/releases/download/v0.1.2/damas-aarch64-macos"
      sha256 "4ad8a4313658d12e1883335baca37ca8ad4de699f01f59a493bde48c0e03685f"
    end
    on_intel do
      url "https://github.com/vmvarela/damas/releases/download/v0.1.2/damas-x86_64-macos"
      sha256 "508fb8b3259945df3f2032d66dfcdb7a1bc4d0d3ebfaac2be15f052ec1509456"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vmvarela/damas/releases/download/v0.1.2/damas-aarch64-linux"
      sha256 "043e828b42dafa27b61d636b4f49113797549f3c6f556bf4b13050ceab5e9347"
    end
    on_intel do
      url "https://github.com/vmvarela/damas/releases/download/v0.1.2/damas-x86_64-linux"
      sha256 "d09a932dabef8ae6803b3df374f2562d366119590f5cdb4f9ce1245eb852d875"
    end
  end

  def install
    bin.install Dir["damas*"].first => "damas"
  end

  test do
    assert_match "damas", shell_output("#{bin}/damas --version 2>&1")
  end
end
