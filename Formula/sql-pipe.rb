class SqlPipe < Formula
  desc "Read CSV from stdin, query with SQL, write CSV to stdout"
  homepage "https://github.com/vmvarela/sql-pipe"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.7.0/sql-pipe-aarch64-macos"
      sha256 "49865a86916e142a419da7738b3c5366ba9f2fa466f546100a3d901d570b52d8"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.7.0/sql-pipe-x86_64-macos"
      sha256 "0ce922a66cee29754d6de7574a13295e4a3129a731715d53adcadbba354b62bf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.7.0/sql-pipe-aarch64-linux"
      sha256 "0041ec4bcc14e14eea37a12f9bf2d521d90feef6133c3ca41ca961184cf06768"
    end
    on_intel do
      url "https://github.com/vmvarela/sql-pipe/releases/download/v0.7.0/sql-pipe-x86_64-linux"
      sha256 "f9f1e630eb60c32c77105920d8680593c23c33c56ff21f76b72bfee6fd9d19dc"
    end
  end

  resource "man" do
    url "https://github.com/vmvarela/sql-pipe/releases/download/v0.7.0/sql-pipe.1.gz"
    sha256 "a37d5d65127e6ac21a408127a0fecc09013ccd31d4e3074317288f663a1a8c6c"
  end

  def install
    bin.install Dir["sql-pipe*"].first => "sql-pipe"
    resource("man").stage { man1.install Dir["*"].first => "sql-pipe.1.gz" }
  end

  test do
    assert_match "sql-pipe", shell_output("#{bin}/sql-pipe --version 2>&1")
  end
end
