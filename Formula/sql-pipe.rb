class SqlPipe < Formula
  desc "Read CSV from stdin, query with SQL, write CSV to stdout"
  homepage "https://github.com/vmvarela/sql-pipe"
  version "0.18.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.18.1/sql-pipe-aarch64-macos"
      sha256 "5fd26745263c51dfe4bd5849e62d9e982f630d09fe1c62cf326c41f9c4f9f434"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.18.1/sql-pipe-x86_64-macos"
      sha256 "d6190464a6a0d32e6db26cb89c6cf8c80d1e9396444cdc1fe59442d0ee652504"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.18.1/sql-pipe-aarch64-linux"
      sha256 "e3594e292e343bac7010b20c8928dc90b125e537566c7afccd451f16247bb8fe"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.18.1/sql-pipe-x86_64-linux"
      sha256 "f3685be6f46e9fcf6913489a5e12f9395ef10a63b8d8a310651a980342410ab9"
    end
  end

  resource "man" do
    url "https://github.com/vmvarela/sql-pipe/releases/download/v0.18.1/sql-pipe.1.gz"
    sha256 "edb24cd95887afc54adcbb761341ec5e0889e2af99b2a8ad606aa7f4aeaa6820"
  end

  def install
    bin.install Dir["sql-pipe*"].first => "sql-pipe"
    resource("man").stage { man1.install Dir["*"].first => "sql-pipe.1.gz" }
  end

  test do
    assert_match "sql-pipe", shell_output("#{bin}/sql-pipe --version 2>&1")
  end
end
