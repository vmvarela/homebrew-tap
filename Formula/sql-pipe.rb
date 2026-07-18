class SqlPipe < Formula
  desc "Read CSV from stdin, query with SQL, write CSV to stdout"
  homepage "https://github.com/vmvarela/sql-pipe"
  version "0.21.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.21.0/sql-pipe-aarch64-macos"
      sha256 "80abdf6dcd83b4c2427489c5527b564b93c1807fb6e3c31f33ba94c0839ca574"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.21.0/sql-pipe-x86_64-macos"
      sha256 "db34850f8bdc90a0e1fd2e9b2cb1c81d65a30879157ef80b224836e5840de6c0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.21.0/sql-pipe-aarch64-linux"
      sha256 "088e10dae3a3e9ab09d3eb782a0ea8d38d2148820a8014439511e4108996c687"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.21.0/sql-pipe-x86_64-linux"
      sha256 "7a443b3abd63c747a8863ff5dabc7fe6c2528163b779fdec446b62a70c69ce83"
    end
  end

  resource "man" do
    url "https://github.com/vmvarela/sql-pipe/releases/download/v0.21.0/sql-pipe.1.gz"
    sha256 "73692a859e90307e72cfec31fdbc5d00e06f3df9d075db2b766db6d3ee7d0f35"
  end

  def install
    bin.install Dir["sql-pipe*"].first => "sql-pipe"
    resource("man").stage { man1.install Dir["*"].first => "sql-pipe.1.gz" }
  end

  test do
    assert_match "sql-pipe", shell_output("#{bin}/sql-pipe --version 2>&1")
  end
end
