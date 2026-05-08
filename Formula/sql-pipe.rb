class SqlPipe < Formula
  desc "Read CSV from stdin, query with SQL, write CSV to stdout"
  homepage "https://github.com/vmvarela/sql-pipe"
  version "0.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.8.1/sql-pipe-aarch64-macos"
      sha256 "515f055cb33e3dc4010ba0718a238c84caad894927b3e1098935f58e88aa38f4"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.8.1/sql-pipe-x86_64-macos"
      sha256 "65864998a713b223eb1e3d820fd4dceb5ea4e1a269c20b3bb0866d11b7fe6815"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.8.1/sql-pipe-aarch64-linux"
      sha256 "3bc12fe44bbd1cc4c5e1e851bf24563dd129dea7d61b5db8d535cbacc60601b3"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.8.1/sql-pipe-x86_64-linux"
      sha256 "ac1d61b2372e8e0cd9506247866e12cecc136c9afcc25f2e47ec8d6c1e6011f2"
    end
  end

  resource "man" do
    url "https://github.com/vmvarela/sql-pipe/releases/download/v0.8.1/sql-pipe.1.gz"
    sha256 "2c1afc632d7d086363b630260bf09875b9927648eaa0e7b3e97e0fd6c2709c25"
  end

  def install
    bin.install Dir["sql-pipe*"].first => "sql-pipe"
    resource("man").stage { man1.install Dir["*"].first => "sql-pipe.1.gz" }
  end

  test do
    assert_match "sql-pipe", shell_output("#{bin}/sql-pipe --version 2>&1")
  end
end
