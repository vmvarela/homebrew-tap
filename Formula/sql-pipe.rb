class SqlPipe < Formula
  desc "Read CSV from stdin, query with SQL, write CSV to stdout"
  homepage "https://github.com/vmvarela/sql-pipe"
  version "0.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.13.0/sql-pipe-aarch64-macos"
      sha256 "207ffe8de5d01902e02c140535901e1cc89d1bf63257243a9db0c4d499c2c76b"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.13.0/sql-pipe-x86_64-macos"
      sha256 "c9ca8e77167867e5ff1989342065f8c495a7b9bcf36ca877abecd3e08ed5eb9e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.13.0/sql-pipe-aarch64-linux"
      sha256 "eedb07bd8137fd7fc70b04b811887b615ba94002241cba82e19a352303c7c800"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.13.0/sql-pipe-x86_64-linux"
      sha256 "eeb9061ad16b8ed47c852a1532a3dce15f716add6b2c03908a7540f1384268b3"
    end
  end

  resource "man" do
    url "https://github.com/vmvarela/sql-pipe/releases/download/v0.13.0/sql-pipe.1.gz"
    sha256 "3ff9da226e6e347fc5104d351a771fdbe3b685afdb4f5b4c41ead1bea5e8199f"
  end

  def install
    bin.install Dir["sql-pipe*"].first => "sql-pipe"
    resource("man").stage { man1.install Dir["*"].first => "sql-pipe.1.gz" }
  end

  test do
    assert_match "sql-pipe", shell_output("#{bin}/sql-pipe --version 2>&1")
  end
end
