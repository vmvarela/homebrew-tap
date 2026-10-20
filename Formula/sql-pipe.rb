class SqlPipe < Formula
  desc "Read CSV from stdin, query with SQL, write CSV to stdout"
  homepage "https://github.com/vmvarela/sql-pipe"
  version "0.27.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.27.0/sql-pipe-aarch64-macos"
      sha256 "c2709232a21915d2a77bbe6b38c9e048def836136af4e84d3ba0f30875c6fa08"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.27.0/sql-pipe-x86_64-macos"
      sha256 "b9aa0d3bedde925b356b7ccafbcd87e47208d17d6a62172af420658873db1881"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.27.0/sql-pipe-aarch64-linux"
      sha256 "22d5d61b2f5931dcf974367af47b86d3d16baad11a5393338faee8f14bb1d148"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.27.0/sql-pipe-x86_64-linux"
      sha256 "69bcf5e7d84c1195cdd90a65e88ffd7aa98de9bc2a1e72b565420f61be4baeae"
    end
  end

  resource "man" do
    url "https://github.com/vmvarela/sql-pipe/releases/download/v0.27.0/sql-pipe.1.gz"
    sha256 "f440aa64aef3995fe2c26b5bfd9a35e7cbff0d6221a147961f74215a20e10018"
  end

  def install
    bin.install Dir["sql-pipe*"].first => "sql-pipe"
    resource("man").stage { man1.install Dir["*"].first => "sql-pipe.1.gz" }
  end

  test do
    assert_match "sql-pipe", shell_output("#{bin}/sql-pipe --version 2>&1")
  end
end
