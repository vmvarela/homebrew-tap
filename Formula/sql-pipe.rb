class SqlPipe < Formula
  desc "Read CSV from stdin, query with SQL, write CSV to stdout"
  homepage "https://github.com/vmvarela/sql-pipe"
  version "0.26.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.26.0/sql-pipe-aarch64-macos"
      sha256 "fbd836c8f51c0f5a03ae8e9734f885332c2867741a3ea0cba231a8a089d9b644"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.26.0/sql-pipe-x86_64-macos"
      sha256 "f5ad2dc4cc96a54e46d1fcbeb67a8a600a50ee3547d88a3b0b3610e7ee2e953d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.26.0/sql-pipe-aarch64-linux"
      sha256 "b58b6b1ed0aca640103aef1dd632f994badbcba6aa27e22b7bb767a86ef1a4cd"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.26.0/sql-pipe-x86_64-linux"
      sha256 "378b70088526843c6d0ee0fcdaef7bf6384ee93af11b668f4d7edb4ef2fa0c0f"
    end
  end

  resource "man" do
    url "https://github.com/vmvarela/sql-pipe/releases/download/v0.26.0/sql-pipe.1.gz"
    sha256 "f7460625ae5b5dc115ffc0b441c5d9bf732ae9a39cf7ddac39f6ed3f0d01f4d7"
  end

  def install
    bin.install Dir["sql-pipe*"].first => "sql-pipe"
    resource("man").stage { man1.install Dir["*"].first => "sql-pipe.1.gz" }
  end

  test do
    assert_match "sql-pipe", shell_output("#{bin}/sql-pipe --version 2>&1")
  end
end
