class SqlPipe < Formula
  desc "Read CSV from stdin, query with SQL, write CSV to stdout"
  homepage "https://github.com/vmvarela/sql-pipe"
  version "0.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.11.0/sql-pipe-aarch64-macos"
      sha256 "44312527888d6fdd38d46978717843ef3bca07bb383bb5879e86c9d37c94d3c3"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.11.0/sql-pipe-x86_64-macos"
      sha256 "91473a0a7560a471e48d8d23bf650edc0b4d9dd751f26b4e73c8e63bbd051cad"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.11.0/sql-pipe-aarch64-linux"
      sha256 "6d3e45f71935826d75e0fb46ee9bfb2012008466e5987debc1b4e676963d221a"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.11.0/sql-pipe-x86_64-linux"
      sha256 "3cbb788d0c70e3450e4f07cd8fe999122ece0a2f43705c65bfabfc6aefb51246"
    end
  end

  resource "man" do
    url "https://github.com/vmvarela/sql-pipe/releases/download/v0.11.0/sql-pipe.1.gz"
    sha256 "eba33d25fe7f3f3daa429363472bdb0462b736133ca22d3bc83cc8c20487e26a"
  end

  def install
    bin.install Dir["sql-pipe*"].first => "sql-pipe"
    resource("man").stage { man1.install Dir["*"].first => "sql-pipe.1.gz" }
  end

  test do
    assert_match "sql-pipe", shell_output("#{bin}/sql-pipe --version 2>&1")
  end
end
