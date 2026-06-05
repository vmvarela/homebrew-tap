class SqlPipe < Formula
  desc "Read CSV from stdin, query with SQL, write CSV to stdout"
  homepage "https://github.com/vmvarela/sql-pipe"
  version "0.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.12.0/sql-pipe-aarch64-macos"
      sha256 "fd4ce15e57058cc857e90af55ec96c2fb7200dc5722c3ade95febfff6b2e171c"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.12.0/sql-pipe-x86_64-macos"
      sha256 "fcbe3bce3acc96db33ac7d04eb2d41b5843fe244615e333b02c72a06fb552f36"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.12.0/sql-pipe-aarch64-linux"
      sha256 "8780e53ad69916fa45a04ae02aa67a7bcd49eb5b2b6f7fea9555ed18ff4dcd11"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.12.0/sql-pipe-x86_64-linux"
      sha256 "6846d30802e895c6277a064b113d985c0ef1b66367f40b4887191c610870bc60"
    end
  end

  resource "man" do
    url "https://github.com/vmvarela/sql-pipe/releases/download/v0.12.0/sql-pipe.1.gz"
    sha256 "ebd1620b0285c42bffbe70158170df5ec3720c303f84341ae0fda2d4c72e4268"
  end

  def install
    bin.install Dir["sql-pipe*"].first => "sql-pipe"
    resource("man").stage { man1.install Dir["*"].first => "sql-pipe.1.gz" }
  end

  test do
    assert_match "sql-pipe", shell_output("#{bin}/sql-pipe --version 2>&1")
  end
end
