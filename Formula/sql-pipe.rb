class SqlPipe < Formula
  desc "Read CSV from stdin, query with SQL, write CSV to stdout"
  homepage "https://github.com/vmvarela/sql-pipe"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.6.0/sql-pipe-aarch64-macos"
      sha256 "5f61330dfbd17a5b42a5454c808b2b596277c6ca8ada476351099006aeb46e6a"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.6.0/sql-pipe-x86_64-macos"
      sha256 "68a9e2c0d5beb2d43774a94c0bef10369fef81caeedcdda03a47bb341738dde4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.6.0/sql-pipe-aarch64-linux"
      sha256 "a0cc2c2ac3037afd0aeae50d2fd1bf587c7582974065a34a4628a2aec11ba701"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.6.0/sql-pipe-x86_64-linux"
      sha256 "8863ee27eb7dd22ff834efb68a65f92ee663f321b21c471d979fdbeb9ee56263"
    end
  end

  resource "man" do
    url "https://github.com/vmvarela/sql-pipe/releases/download/v0.6.0/sql-pipe.1.gz"
    sha256 "ebd6f24ef174b79611433f896bd37b1e2ff7c11c844ebd134d339508f4aa3ca9"
  end

  def install
    bin.install Dir["sql-pipe*"].first => "sql-pipe"
    resource("man").stage { man1.install Dir["*"].first => "sql-pipe.1.gz" }
  end

  test do
    assert_match "sql-pipe", shell_output("#{bin}/sql-pipe --version 2>&1")
  end
end
