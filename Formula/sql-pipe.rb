class SqlPipe < Formula
  desc "Read CSV from stdin, query with SQL, write CSV to stdout"
  homepage "https://github.com/vmvarela/sql-pipe"
  version "0.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.14.0/sql-pipe-aarch64-macos"
      sha256 "9dd42a76b151690fda891044925ac1252e0ff365b0db01d2c120ccc5efedf084"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.14.0/sql-pipe-x86_64-macos"
      sha256 "e8fff9ef26704686fa41aa270eadb5f403b9e797c6148e41cff0530bd2960565"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.14.0/sql-pipe-aarch64-linux"
      sha256 "43ea8dc6d3f19316bafa72e58cf42dab9b55c420c3d5042128285285403bf377"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.14.0/sql-pipe-x86_64-linux"
      sha256 "f54ded2452baa5f41cc36e3a018253c0c9a562cbd829f57001f3fa518af965b3"
    end
  end

  resource "man" do
    url "https://github.com/vmvarela/sql-pipe/releases/download/v0.14.0/sql-pipe.1.gz"
    sha256 "36ec1ffa4ea6dd2c9fdff35a349865ee52d899ec6c459e61e9c44551ee92ce5e"
  end

  def install
    bin.install Dir["sql-pipe*"].first => "sql-pipe"
    resource("man").stage { man1.install Dir["*"].first => "sql-pipe.1.gz" }
  end

  test do
    assert_match "sql-pipe", shell_output("#{bin}/sql-pipe --version 2>&1")
  end
end
