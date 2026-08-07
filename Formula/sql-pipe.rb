class SqlPipe < Formula
  desc "Read CSV from stdin, query with SQL, write CSV to stdout"
  homepage "https://github.com/vmvarela/sql-pipe"
  version "0.25.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.25.0/sql-pipe-aarch64-macos"
      sha256 "d710018f7d91b5f5b31c4b8092377478a5585cdfd6f34fa818e1fe2b767f053f"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.25.0/sql-pipe-x86_64-macos"
      sha256 "514da96661fc13006343a48432a9b559205439e247d67ea0b658c5bad9624d6b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.25.0/sql-pipe-aarch64-linux"
      sha256 "3a4dcc709bc1354cd32d07e61b6882d9f8feb6859ae0f0e01ecfeae05529f45a"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.25.0/sql-pipe-x86_64-linux"
      sha256 "d5938c2886e44a6c235ce2ead98eae8eb3740200334c36983742467a3f146da9"
    end
  end

  resource "man" do
    url "https://github.com/vmvarela/sql-pipe/releases/download/v0.25.0/sql-pipe.1.gz"
    sha256 "088ff6d5a7b3914796f490493a6b55438afd27321505240bbc6ab0b8c0be8b76"
  end

  def install
    bin.install Dir["sql-pipe*"].first => "sql-pipe"
    resource("man").stage { man1.install Dir["*"].first => "sql-pipe.1.gz" }
  end

  test do
    assert_match "sql-pipe", shell_output("#{bin}/sql-pipe --version 2>&1")
  end
end
