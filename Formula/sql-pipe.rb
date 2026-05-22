class SqlPipe < Formula
  desc "Read CSV from stdin, query with SQL, write CSV to stdout"
  homepage "https://github.com/vmvarela/sql-pipe"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.10.0/sql-pipe-aarch64-macos"
      sha256 "1395ae94adffca6ae4a7f90c6ddf9c783bd078241de23fe6bd43556a3d2ca84d"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.10.0/sql-pipe-x86_64-macos"
      sha256 "ff0ffd9412e41de548c90a39d5a6e5b580dadc775f6c4ab3e652f03995c87ab6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.10.0/sql-pipe-aarch64-linux"
      sha256 "08dbffacc3d81c731f22757eb7fa93ff3e4af9f8de95e82204df5f71ffb74133"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.10.0/sql-pipe-x86_64-linux"
      sha256 "5d40c243ab1b93bbdc76f5418018388a0dfdadacd509e12f9bfb72ed29fee738"
    end
  end

  resource "man" do
    url "https://github.com/vmvarela/sql-pipe/releases/download/v0.10.0/sql-pipe.1.gz"
    sha256 "bc32297cf3e3071770c80f23d2191056a0ad147501a0ef947dd98b651e8d6f22"
  end

  def install
    bin.install Dir["sql-pipe*"].first => "sql-pipe"
    resource("man").stage { man1.install Dir["*"].first => "sql-pipe.1.gz" }
  end

  test do
    assert_match "sql-pipe", shell_output("#{bin}/sql-pipe --version 2>&1")
  end
end
