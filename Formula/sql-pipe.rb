class SqlPipe < Formula
  desc "Read CSV from stdin, query with SQL, write CSV to stdout"
  homepage "https://github.com/vmvarela/sql-pipe"
  version "0.27.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.27.1/sql-pipe-aarch64-macos"
      sha256 "30364d801b43b0fa1950de9e88035575bfd699ae9ba27d43d47568eca14c52c2"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.27.1/sql-pipe-x86_64-macos"
      sha256 "da9cb0125bae13f016f6ba72d5ebc58b265134d2f1bcd919008f75f4fd1bc54d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.27.1/sql-pipe-aarch64-linux"
      sha256 "60dd0e5e48331cbe47049491f2733cd6ebaedc306365e3eb0a7470c8cdeeeb50"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.27.1/sql-pipe-x86_64-linux"
      sha256 "6a230bbdf1e5ba8cd524eb90a474b6d5f7c6cb9509268744e16ef3578a8fe87d"
    end
  end

  resource "man" do
    url "https://github.com/vmvarela/sql-pipe/releases/download/v0.27.1/sql-pipe.1.gz"
    sha256 "c534a6ff43f8c17c882653b08c222ddd757340f5807c69e2ef290a3f7c6065bc"
  end

  def install
    bin.install Dir["sql-pipe*"].first => "sql-pipe"
    resource("man").stage { man1.install Dir["*"].first => "sql-pipe.1.gz" }
  end

  test do
    assert_match "sql-pipe", shell_output("#{bin}/sql-pipe --version 2>&1")
  end
end
