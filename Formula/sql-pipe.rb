class SqlPipe < Formula
  desc "Read CSV from stdin, query with SQL, write CSV to stdout"
  homepage "https://github.com/vmvarela/sql-pipe"
  version "0.25.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.25.1/sql-pipe-aarch64-macos"
      sha256 "675d514266661ba6e5f1d2aeb6988bfd5e270a2140e954d69ffecccc0abd0d57"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.25.1/sql-pipe-x86_64-macos"
      sha256 "23a51dbfd6910d44fc14de10f5744c0e795a214260021881ab096904f8f02a7f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.25.1/sql-pipe-aarch64-linux"
      sha256 "fd6e848a27ee6b7e64868976a1e3d46506404bdb7d3ad9779afbd5ad908b4234"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.25.1/sql-pipe-x86_64-linux"
      sha256 "5309c73e657f269dcb5fdf8384f93439fcdd45cc3e2da2285cd5943fd7826bd1"
    end
  end

  resource "man" do
    url "https://github.com/vmvarela/sql-pipe/releases/download/v0.25.1/sql-pipe.1.gz"
    sha256 "71d7a446cb3bae1894db7c86ff1d3c738b6d4ff5a29cd681e83e3d73b3ced3a1"
  end

  def install
    bin.install Dir["sql-pipe*"].first => "sql-pipe"
    resource("man").stage { man1.install Dir["*"].first => "sql-pipe.1.gz" }
  end

  test do
    assert_match "sql-pipe", shell_output("#{bin}/sql-pipe --version 2>&1")
  end
end
