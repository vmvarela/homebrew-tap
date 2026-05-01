class SqlPipe < Formula
  desc "Read CSV from stdin, query with SQL, write CSV to stdout"
  homepage "https://github.com/vmvarela/sql-pipe"
  version "0.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.7.1/sql-pipe-aarch64-macos"
      sha256 "113e2d2a300aca7c90c6ac203d99d2963b3c5e81c4cb6aafafd64825698f9926"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.7.1/sql-pipe-x86_64-macos"
      sha256 "2b00b03ce297ce6bf37e7ac3ca0e856f46db209424455e926214633371671dbe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.7.1/sql-pipe-aarch64-linux"
      sha256 "8702c78840c978b9e14f0123c7e850f90d20406f20e0d06e0b3eb4c5a2be7eba"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.7.1/sql-pipe-x86_64-linux"
      sha256 "82ee1efabb52530182d5a4545b00ff8eaba806dc144f1456664ebebb8952fe1a"
    end
  end

  resource "man" do
    url "https://github.com/vmvarela/sql-pipe/releases/download/v0.7.1/sql-pipe.1.gz"
    sha256 "a37d5d65127e6ac21a408127a0fecc09013ccd31d4e3074317288f663a1a8c6c"
  end

  def install
    bin.install Dir["sql-pipe*"].first => "sql-pipe"
    resource("man").stage { man1.install Dir["*"].first => "sql-pipe.1.gz" }
  end

  test do
    assert_match "sql-pipe", shell_output("#{bin}/sql-pipe --version 2>&1")
  end
end
