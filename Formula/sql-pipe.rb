class SqlPipe < Formula
  desc "Read CSV from stdin, query with SQL, write CSV to stdout"
  homepage "https://github.com/vmvarela/sql-pipe"
  version "0.17.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.17.1/sql-pipe-aarch64-macos"
      sha256 "295f4c17c06bd0e69b3d6c78484297c737e735ef4f63a7ff93e80c768d34bc4a"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.17.1/sql-pipe-x86_64-macos"
      sha256 "ea388a307c0ff28f7ac662ac5d9441a6fddc3007375c374da358aa3c36089d28"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.17.1/sql-pipe-aarch64-linux"
      sha256 "f6ef603d1efee3ce723a066ef3272099bdfdecb7f78aff2006f5f3bdf12366c5"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.17.1/sql-pipe-x86_64-linux"
      sha256 "76ee4a71bd66e605af8759421ddb190a9805fee5ae902d61a814ba841e03b86e"
    end
  end

  resource "man" do
    url "https://github.com/vmvarela/sql-pipe/releases/download/v0.17.1/sql-pipe.1.gz"
    sha256 "ea509caf0923c168ed49f91d8f2e54360bd221b05c818a9f80595ee51f470efe"
  end

  def install
    bin.install Dir["sql-pipe*"].first => "sql-pipe"
    resource("man").stage { man1.install Dir["*"].first => "sql-pipe.1.gz" }
  end

  test do
    assert_match "sql-pipe", shell_output("#{bin}/sql-pipe --version 2>&1")
  end
end
