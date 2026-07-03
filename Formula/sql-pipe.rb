class SqlPipe < Formula
  desc "Read CSV from stdin, query with SQL, write CSV to stdout"
  homepage "https://github.com/vmvarela/sql-pipe"
  version "0.16.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.16.0/sql-pipe-aarch64-macos"
      sha256 "e564c519b45df606fd54a74fba890ef9ee511cf868f0a932b327d12bf7140747"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.16.0/sql-pipe-x86_64-macos"
      sha256 "64673c456d8a25546136ebbbbda445020ba9cc54fe590f0f173c5dcaba010d04"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.16.0/sql-pipe-aarch64-linux"
      sha256 "acdbc8515230d8711d487c96315ea37c163e27aed59c6dea0e3a806c568724ce"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.16.0/sql-pipe-x86_64-linux"
      sha256 "cf3a0e7685f7ca03a31cbbbe00378d0e9d98e55a2c860d460868633027aa5fd0"
    end
  end

  resource "man" do
    url "https://github.com/vmvarela/sql-pipe/releases/download/v0.16.0/sql-pipe.1.gz"
    sha256 "23a1c7e94cd313999bcfeceb74bb57bf3294e28c339b2a77b66c51e453f1919a"
  end

  def install
    bin.install Dir["sql-pipe*"].first => "sql-pipe"
    resource("man").stage { man1.install Dir["*"].first => "sql-pipe.1.gz" }
  end

  test do
    assert_match "sql-pipe", shell_output("#{bin}/sql-pipe --version 2>&1")
  end
end
