class Damas < Formula
  desc "Checkers game: CLI, TUI and embedded web server in one binary"
  homepage "https://github.com/vmvarela/damas"
  version "0.1.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vmvarela/damas/releases/download/v0.1.6/damas-aarch64-macos"
      sha256 "1a398bf6fafddef4d66255625de2a424f550a131ec03c94ceaca991da6f68b71"
    end
    on_intel do
      url "https://github.com/vmvarela/damas/releases/download/v0.1.6/damas-x86_64-macos"
      sha256 "c0d81ae54bc295a4eceda4f4855e8b2baa1fb4ddbd9d42522c0b18c8b02736e6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vmvarela/damas/releases/download/v0.1.6/damas-aarch64-linux"
      sha256 "9677af813d4a46d655727eea063a587bfbd42ba3de0faf4785549a13144e18d4"
    end
    on_intel do
      url "https://github.com/vmvarela/damas/releases/download/v0.1.6/damas-x86_64-linux"
      sha256 "e9d4da61454bfbb25e121997804cb947fa56a1b08d0aacb7b2f67c24dddbf940"
    end
  end

  def install
    bin.install Dir["damas*"].first => "damas"
  end

  test do
    assert_match "damas", shell_output("#{bin}/damas --version 2>&1")
  end
end
