class Damas < Formula
  desc "Checkers game: CLI, TUI and embedded web server in one binary"
  homepage "https://github.com/vmvarela/damas"
  version "0.1.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vmvarela/damas/releases/download/v0.1.10/damas-aarch64-macos"
      sha256 "c5b79c0d7b99f90147b0acb210535eb73dfc2b98c800046ec9465a7e48484767"
    end
    on_intel do
      url "https://github.com/vmvarela/damas/releases/download/v0.1.10/damas-x86_64-macos"
      sha256 "280639e568bb2a5ab8eb52f2b18012c278894bfe3ccbd3aabc7fbd908628c825"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vmvarela/damas/releases/download/v0.1.10/damas-aarch64-linux"
      sha256 "7a9295b693862b39cdd8285fe34f5ff643dd61f80d797665c5622db1216b0d20"
    end
    on_intel do
      url "https://github.com/vmvarela/damas/releases/download/v0.1.10/damas-x86_64-linux"
      sha256 "ec3b3e2853e5f3f561c6b803c38f4c153db46ee8877daad2f36a91841656fd9a"
    end
  end

  resource "man" do
    url "https://github.com/vmvarela/damas/releases/download/v0.1.10/damas.1.gz"
    sha256 "78ca0d820c45a0b495221cd516b82b94f6fdf3c69268c17a2a1eae6ab0a17396"
  end

  def install
    bin.install Dir["damas*"].first => "damas"
    resource("man").stage do
      man1.install "damas.1.gz"
    end
  end

  test do
    assert_match "damas", shell_output("#{bin}/damas --version 2>&1")
  end
end
