class ZeppLife < Formula
  desc "Store your Zepp Life data locally and inspect it"
  homepage "https://github.com/vmvarela/zepp-life"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vmvarela/zepp-life/releases/download/v0.1.0/zepp-life-darwin-arm64"
      sha256 "a8aa7314b22c3f8aae982e9a7a20af19ebf0bad075eabc41644522c6900d425a"
    end
    on_intel do
      url "https://github.com/vmvarela/zepp-life/releases/download/v0.1.0/zepp-life-darwin-amd64"
      sha256 "da92ec636c009879a3962496382e812bdc4df9edba89222630880a4eaebbdefc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vmvarela/zepp-life/releases/download/v0.1.0/zepp-life-linux-arm64"
      sha256 "ab9da6ccbccdc297de76b508f2b60b990298d550067aafaef25eedb6138f04d9"
    end
    on_intel do
      url "https://github.com/vmvarela/zepp-life/releases/download/v0.1.0/zepp-life-linux-amd64"
      sha256 "bc1b3e16543585ab3437f731c28c6a34a86adb2892f22b530d826694bbb94456"
    end
  end

  resource "man" do
    url "https://github.com/vmvarela/zepp-life/releases/download/v0.1.0/zepp-life.1.gz",
        using: :nounzip
    sha256 "d4f03a5dc3265be628ce647f57e13aa2154e24b0ceba64de46c8be328f571df6"
  end

  resource "notices" do
    url "https://github.com/vmvarela/zepp-life/releases/download/v0.1.0/THIRD_PARTY_NOTICES.txt"
    sha256 "6eff2772ec2040ea4c85828b4b797e2b181ca682fcc847819e392724660fe143"
  end

  def install
    bin.install Dir["zepp-life*"].first => "zepp-life"
    # The release asset is a plain curl download, not executable.
    chmod 0755, bin/"zepp-life"
    # :nounzip keeps the gz bytes, so the name matches the content.
    resource("man").stage { man1.install "zepp-life.1.gz" }
    resource("notices").stage do
      (share/"licenses/zepp-life").install "THIRD_PARTY_NOTICES.txt"
    end
  end

  test do
    assert_match "zepp-life", shell_output("#{bin}/zepp-life --version 2>&1")
  end
end
