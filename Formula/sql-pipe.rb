class SqlPipe < Formula
  desc "Read CSV from stdin, query with SQL, write CSV to stdout"
  homepage "https://github.com/vmvarela/sql-pipe"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.9.0/sql-pipe-aarch64-macos"
      sha256 "458ac83e7fa54fbd2b67e6b2f371a468c839ee0c9f1fe84ff41927f72e970f91"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.9.0/sql-pipe-x86_64-macos"
      sha256 "ae3f396e8cf6f855b074416e191aa0b9a5258107da19585df4ac2b9934b0bb9d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.9.0/sql-pipe-aarch64-linux"
      sha256 "c843455ad07a9ef4283ab6fbd311295bce0e4195868cc2fb945379f64ac2be73"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.9.0/sql-pipe-x86_64-linux"
      sha256 "326417dc77fe2a686c8a20498c36a8ae6d037a5ee332a38c1e8bfe1e257643b0"
    end
  end

  resource "man" do
    url "https://github.com/vmvarela/sql-pipe/releases/download/v0.9.0/sql-pipe.1.gz"
    sha256 "d13ce015426ccf6a5c0d8f69b5592e2a2079def0c332844f07b2fe3499df8afa"
  end

  def install
    bin.install Dir["sql-pipe*"].first => "sql-pipe"
    resource("man").stage { man1.install Dir["*"].first => "sql-pipe.1.gz" }
  end

  test do
    assert_match "sql-pipe", shell_output("#{bin}/sql-pipe --version 2>&1")
  end
end
