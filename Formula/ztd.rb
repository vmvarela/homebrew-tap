class Ztd < Formula
  desc "Local task system for humans and agents"
  homepage "https://github.com/vmvarela/ztd"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vmvarela/ztd/releases/download/v0.3.0/ztd-aarch64-macos"
      sha256 "5607f73acc08e2dd4fdb6d542e50d96b4cc494639ec9d73bff07508b88fb68ac"
    end
    on_intel do
      url "https://github.com/vmvarela/ztd/releases/download/v0.3.0/ztd-x86_64-macos"
      sha256 "1013d189956f368762b6d1160341afdde09abda14cb9d7bc31ac1905ddd229cb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vmvarela/ztd/releases/download/v0.3.0/ztd-aarch64-linux"
      sha256 "f1199bc17395d71e09ebc3b749623572d8a38e48ec2f1889a90c1ff40bc9093c"
    end
    on_intel do
      url "https://github.com/vmvarela/ztd/releases/download/v0.3.0/ztd-x86_64-linux"
      sha256 "dd19c31111e9d828344c80b45c88d846ddca194bf858ca77c37b85ab9ffd868e"
    end
  end

  resource "man" do
    url "https://github.com/vmvarela/ztd/releases/download/v0.3.0/ztd.1.gz"
    sha256 "dfd23999e017988f329a919fa933ac9e89acdf568ea76570b4ec2f0e293fd52e"
  end

  def install
    bin.install Dir["ztd*"].first => "ztd"
    resource("man").stage do
      man1.install Dir["ztd.1*"].first
    end
  end

  test do
    assert_match "version", shell_output("#{bin}/ztd version 2>&1")
  end
end
