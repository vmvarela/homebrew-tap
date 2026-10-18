class Damas < Formula
  desc "Checkers game: CLI, TUI and embedded web server in one binary"
  homepage "https://github.com/vmvarela/damas"
  version "0.1.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vmvarela/damas/releases/download/v0.1.9/damas-aarch64-macos"
      sha256 "0cf376ec01fef81918cf36cf17bf3d3aa777d8d0d060670fcc48efb20ce5af1e"
    end
    on_intel do
      url "https://github.com/vmvarela/damas/releases/download/v0.1.9/damas-x86_64-macos"
      sha256 "718f5b4dc2883d54670794d038d93504b28fd049eb9031d762d4059bd805dcd2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vmvarela/damas/releases/download/v0.1.9/damas-aarch64-linux"
      sha256 "3c4c42842822308a85dec89776e37c18dbebb9ee82d20af07fa24ebea60d234a"
    end
    on_intel do
      url "https://github.com/vmvarela/damas/releases/download/v0.1.9/damas-x86_64-linux"
      sha256 "0b564c4857c0ae8c4df7942695b761617426fae0d64cbf38a0f576b289141eaf"
    end
  end

  resource "man" do
    url "https://github.com/vmvarela/damas/releases/download/v0.1.9/damas.1.gz"
    sha256 "e1a5a9955ea2e7c1d6239cb51ceae5ac685711eeda0d937cd4a29a453c0c4990"
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
