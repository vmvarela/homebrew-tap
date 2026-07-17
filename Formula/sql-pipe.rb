class SqlPipe < Formula
  desc "Read CSV from stdin, query with SQL, write CSV to stdout"
  homepage "https://github.com/vmvarela/sql-pipe"
  version "0.20.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.20.0/sql-pipe-aarch64-macos"
      sha256 "f48c9186f4d679540dbb8857e070a7fc8db1b0776ddb1e097e41ef68a92af726"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.20.0/sql-pipe-x86_64-macos"
      sha256 "4feb19e5e99a219922e4aca3280c88e63af82e537a087ed3742d2d54205ee931"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.20.0/sql-pipe-aarch64-linux"
      sha256 "7cfbb59febb6fa6453147c9f8c6e237dc3942944450287e2e7ae12b3b166a564"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.20.0/sql-pipe-x86_64-linux"
      sha256 "7a97b56b72348af7b315635e3f31480f8a2e0517c8e24bd0036748a72944c1cf"
    end
  end

  resource "man" do
    url "https://github.com/vmvarela/sql-pipe/releases/download/v0.20.0/sql-pipe.1.gz"
    sha256 "40bbe91ea061ecc949c3a177f89e915b7241b100b1ddd2971a48f38d74eaaf3c"
  end

  def install
    bin.install Dir["sql-pipe*"].first => "sql-pipe"
    resource("man").stage { man1.install Dir["*"].first => "sql-pipe.1.gz" }
  end

  test do
    assert_match "sql-pipe", shell_output("#{bin}/sql-pipe --version 2>&1")
  end
end
