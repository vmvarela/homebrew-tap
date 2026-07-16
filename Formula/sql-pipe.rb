class SqlPipe < Formula
  desc "Read CSV from stdin, query with SQL, write CSV to stdout"
  homepage "https://github.com/vmvarela/sql-pipe"
  version "0.18.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.18.0/sql-pipe-aarch64-macos"
      sha256 "76222719e7e1f91e095d351f5d913eecdc15c6e0d6ac6094467c946da00231b4"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.18.0/sql-pipe-x86_64-macos"
      sha256 "eb499c4c4b4820a1238cea4248c32bcae753a38d6b15767eb49157e8674bdd43"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.18.0/sql-pipe-aarch64-linux"
      sha256 "5a31cfb2e21f5a288605ec7159efee1b44496e56408af08378e9cd20924e277f"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.18.0/sql-pipe-x86_64-linux"
      sha256 "5025ed2e20d7e8eae2c75f2cb46062a855a6b45c93f75de67be60db938f0909e"
    end
  end

  resource "man" do
    url "https://github.com/vmvarela/sql-pipe/releases/download/v0.18.0/sql-pipe.1.gz"
    sha256 "f2f0593c74420eff26ec2b032cbaf07c25b5c03538ae68b828b011bb587eb927"
  end

  def install
    bin.install Dir["sql-pipe*"].first => "sql-pipe"
    resource("man").stage { man1.install Dir["*"].first => "sql-pipe.1.gz" }
  end

  test do
    assert_match "sql-pipe", shell_output("#{bin}/sql-pipe --version 2>&1")
  end
end
