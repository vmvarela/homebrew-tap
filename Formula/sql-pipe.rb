class SqlPipe < Formula
  desc "Read CSV from stdin, query with SQL, write CSV to stdout"
  homepage "https://github.com/vmvarela/sql-pipe"
  version "0.24.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.24.0/sql-pipe-aarch64-macos"
      sha256 "a2957afe346cc2fd27ff4a8fb20a81be185ba082e8ce15d2ce43f636f21452d0"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.24.0/sql-pipe-x86_64-macos"
      sha256 "3137e5de40e3f3d974f6d5c73620c800662b8b44f09c3ea0c5abbcb43e71737c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.24.0/sql-pipe-aarch64-linux"
      sha256 "efafdf7f06f52a12e4e2e16f348f90294b99a96a48b2e533d85e3a9efdc4f648"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.24.0/sql-pipe-x86_64-linux"
      sha256 "6d5f62cb87834c447f7debda5bc380c7727c0c1d0b7874fe340f1040af4fe1b4"
    end
  end

  resource "man" do
    url "https://github.com/vmvarela/sql-pipe/releases/download/v0.24.0/sql-pipe.1.gz"
    sha256 "3eb1a4d67bfac9f0b3debb13f2f33f4ae0e994e3f1cbcb7aa0f996a711313f00"
  end

  def install
    bin.install Dir["sql-pipe*"].first => "sql-pipe"
    resource("man").stage { man1.install Dir["*"].first => "sql-pipe.1.gz" }
  end

  test do
    assert_match "sql-pipe", shell_output("#{bin}/sql-pipe --version 2>&1")
  end
end
