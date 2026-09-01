class Damas < Formula
  desc "Checkers game: CLI, TUI and embedded web server in one binary"
  homepage "https://github.com/vmvarela/damas"
  version "0.1.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vmvarela/damas/releases/download/v0.1.7/damas-aarch64-macos"
      sha256 "cffdab6b820b1ae7a89572bec2f43d79362367001a63e0d35cd365a0fd83c22d"
    end
    on_intel do
      url "https://github.com/vmvarela/damas/releases/download/v0.1.7/damas-x86_64-macos"
      sha256 "9697a2c31a3898bd746805c29156ee81e6ea9859ec7f92712e812979a6b54424"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vmvarela/damas/releases/download/v0.1.7/damas-aarch64-linux"
      sha256 "09d1fe78510beabf98b42c839a83cae9a305506ddad1cb15159421f54e83a118"
    end
    on_intel do
      url "https://github.com/vmvarela/damas/releases/download/v0.1.7/damas-x86_64-linux"
      sha256 "935fd8f8e884eb1fc5837e75e1ac3c081dc676960735191022d099f39cce3caf"
    end
  end

  def install
    bin.install Dir["damas*"].first => "damas"
  end

  test do
    assert_match "damas", shell_output("#{bin}/damas --version 2>&1")
  end
end
