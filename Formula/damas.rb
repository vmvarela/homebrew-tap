class Damas < Formula
  desc "Checkers game: CLI, TUI and embedded web server in one binary"
  homepage "https://github.com/vmvarela/damas"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vmvarela/damas/releases/download/v0.1.3/damas-aarch64-macos"
      sha256 "98fb3c4fd8ee8c05423d11952a4bada32a7c332f70ea5bec56e184b151b9a4b6"
    end
    on_intel do
      url "https://github.com/vmvarela/damas/releases/download/v0.1.3/damas-x86_64-macos"
      sha256 "d00af751f2068fccb1b896f28f02e48a1207b26304950b77cb52f9c95107e010"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vmvarela/damas/releases/download/v0.1.3/damas-aarch64-linux"
      sha256 "c2e49cdb8f1861f2cb659486f7d09aa103d79033fb22a2392d9d240d66c1de94"
    end
    on_intel do
      url "https://github.com/vmvarela/damas/releases/download/v0.1.3/damas-x86_64-linux"
      sha256 "a0be0044d7f0e388f6b2868c8b9de906389cd370d6341b5ede11c2102cab049c"
    end
  end

  def install
    bin.install Dir["damas*"].first => "damas"
  end

  test do
    assert_match "damas", shell_output("#{bin}/damas --version 2>&1")
  end
end
