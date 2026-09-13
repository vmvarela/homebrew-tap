class Damas < Formula
  desc "Checkers game: CLI, TUI and embedded web server in one binary"
  homepage "https://github.com/vmvarela/damas"
  version "0.1.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vmvarela/damas/releases/download/v0.1.8/damas-aarch64-macos"
      sha256 "d756e5a2c28374d111a2a4db7844be9f41979aa7714934c0dcf614ab9080f8e7"
    end
    on_intel do
      url "https://github.com/vmvarela/damas/releases/download/v0.1.8/damas-x86_64-macos"
      sha256 "772018c417d3e3715512d726f41c8d20714a577d278ef0eac6b5adc8d215aab2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vmvarela/damas/releases/download/v0.1.8/damas-aarch64-linux"
      sha256 "ce59d33841740f9f15e5ee8f1dfa23b25a85acbdc178c674b521a2ff1cc57fc6"
    end
    on_intel do
      url "https://github.com/vmvarela/damas/releases/download/v0.1.8/damas-x86_64-linux"
      sha256 "4f9bfeb32a622404d905a15353f693b500861009e5b4d9747b2ee3e9fa775084"
    end
  end

  resource "man" do
    url "https://github.com/vmvarela/damas/releases/download/v0.1.8/damas.1.gz"
    sha256 "e28f942e82dabae334857b3e69a95661db3e077b5007d45edb7e90837ecb8606"
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
