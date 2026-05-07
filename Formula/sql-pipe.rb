class SqlPipe < Formula
  desc "Read CSV from stdin, query with SQL, write CSV to stdout"
  homepage "https://github.com/vmvarela/sql-pipe"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.8.0/sql-pipe-aarch64-macos"
      sha256 "c154790acaa8ecd803ae24624357c9207d3eee8d28fa98063da011a7914696ca"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.8.0/sql-pipe-x86_64-macos"
      sha256 "b53027856158de36e30dee24950fb8ed13fc41c62e878ac896fcc018b252710e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.8.0/sql-pipe-aarch64-linux"
      sha256 "9e5094a797e664e64ba080304c43e1cc4570c9ae15825a5b371f2eb0ec2231a1"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.8.0/sql-pipe-x86_64-linux"
      sha256 "443ddb5dae0effe25dd6aa8ee9304eb3702166e6b9a8cc8bef0347b36b77757a"
    end
  end

  resource "man" do
    url "https://github.com/vmvarela/sql-pipe/releases/download/v0.8.0/sql-pipe.1.gz"
    sha256 "ada46f4b424a61a31ade96a7fc6824c10ab4587acb9b3a18061189d8e7b03c73"
  end

  def install
    bin.install Dir["sql-pipe*"].first => "sql-pipe"
    resource("man").stage { man1.install Dir["*"].first => "sql-pipe.1.gz" }
  end

  test do
    assert_match "sql-pipe", shell_output("#{bin}/sql-pipe --version 2>&1")
  end
end
