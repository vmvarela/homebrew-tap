class SqlPipe < Formula
  desc "Read CSV from stdin, query with SQL, write CSV to stdout"
  homepage "https://github.com/vmvarela/sql-pipe"
  version "0.15.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.15.0/sql-pipe-aarch64-macos"
      sha256 "1730fa6f0f2ed25db11fd09d0d78c5425cec5d746512f32f3053f6cae13ae116"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.15.0/sql-pipe-x86_64-macos"
      sha256 "a47d62bccaadba2ec11a6510646485d04e1aab517f53ab4a38c612d0a2259af3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.15.0/sql-pipe-aarch64-linux"
      sha256 "39e270444021f883f1b8bc24ff72eae59b23ba4da987a12d418f5d346cd68f85"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.15.0/sql-pipe-x86_64-linux"
      sha256 "34778e32c657bf40c2f160dd82b913f5d0c2f3ccd773a78c1575ab3b5fca2a21"
    end
  end

  resource "man" do
    url "https://github.com/vmvarela/sql-pipe/releases/download/v0.15.0/sql-pipe.1.gz"
    sha256 "1964a8dcf42aefba0279ac6b31f7e80f1e80cfb931c232942888c3b9e783627f"
  end

  def install
    bin.install Dir["sql-pipe*"].first => "sql-pipe"
    resource("man").stage { man1.install Dir["*"].first => "sql-pipe.1.gz" }
  end

  test do
    assert_match "sql-pipe", shell_output("#{bin}/sql-pipe --version 2>&1")
  end
end
