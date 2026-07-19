class SqlPipe < Formula
  desc "Read CSV from stdin, query with SQL, write CSV to stdout"
  homepage "https://github.com/vmvarela/sql-pipe"
  version "0.22.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.22.0/sql-pipe-aarch64-macos"
      sha256 "38d65500fa1cda784c77b5dc0d090788ba3542536e8cd57bf3220a7bc6b9d961"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.22.0/sql-pipe-x86_64-macos"
      sha256 "7a4d6ddec14f59319dd0197edf41b465d253fe6f5c7ddda2f250f12926ef7bbb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.22.0/sql-pipe-aarch64-linux"
      sha256 "56bbfb83aac844707748f8f422e1241d92ba90e7eb93b823940768ef5e5d0050"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.22.0/sql-pipe-x86_64-linux"
      sha256 "6334c98f24ab22b8dc97506dacc72b1771a5d62f24d32b18a5fa49537fc88863"
    end
  end

  resource "man" do
    url "https://github.com/vmvarela/sql-pipe/releases/download/v0.22.0/sql-pipe.1.gz"
    sha256 "f172da8fb9170b60854a5fd28dfd87ecec45fd2b8d110d8db474b0e250cec18c"
  end

  def install
    bin.install Dir["sql-pipe*"].first => "sql-pipe"
    resource("man").stage { man1.install Dir["*"].first => "sql-pipe.1.gz" }
  end

  test do
    assert_match "sql-pipe", shell_output("#{bin}/sql-pipe --version 2>&1")
  end
end
