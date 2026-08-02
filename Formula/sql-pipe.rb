class SqlPipe < Formula
  desc "Read CSV from stdin, query with SQL, write CSV to stdout"
  homepage "https://github.com/vmvarela/sql-pipe"
  version "0.23.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.23.0/sql-pipe-aarch64-macos"
      sha256 "eb2caa3fad7f7dcd1360cd3c3e1acbbf8d00fd2ca2bbf8a035e6fdcfb582568a"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.23.0/sql-pipe-x86_64-macos"
      sha256 "c45b78f875c0b4c8f4d9b443c7651897ac6ff901b3c1c28b74c806400e607e82"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.23.0/sql-pipe-aarch64-linux"
      sha256 "3aeba75497e81062d275603d811468144e6924e1fa244873daf51a97a0a81ad0"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.23.0/sql-pipe-x86_64-linux"
      sha256 "41ef4618d606fe9abd031ac04e16bf5e0b41115e1c45fd03810a2331c1da867b"
    end
  end

  resource "man" do
    url "https://github.com/vmvarela/sql-pipe/releases/download/v0.23.0/sql-pipe.1.gz"
    sha256 "95f22dea84211b3a3d9e7c8f18075c8abd714014c8c58eb15200fec7036e3a68"
  end

  def install
    bin.install Dir["sql-pipe*"].first => "sql-pipe"
    resource("man").stage { man1.install Dir["*"].first => "sql-pipe.1.gz" }
  end

  test do
    assert_match "sql-pipe", shell_output("#{bin}/sql-pipe --version 2>&1")
  end
end
