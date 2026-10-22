# typed: false
# frozen_string_literal: true

# This formula consumes Ghoten's published release artifacts.
# Version and checksums must match a stable Ghoten release.

class Ghoten < Formula
  desc 'Thin OpenTofu distribution with Smart Refresh and native OCI state'
  homepage 'https://github.com/vmvarela/ghoten'
  version '1.13.2'
  license 'MPL-2.0'

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/vmvarela/ghoten/releases/download/v#{version}/ghoten_#{version}_darwin_amd64.tar.gz"
    sha256 'dc8c0e53edf491a774767561a8075ee484ce369873df8bd3b877f320b1161877'
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/vmvarela/ghoten/releases/download/v#{version}/ghoten_#{version}_darwin_arm64.tar.gz"
    sha256 'f30eb91a1ca27cfbaa476668d565ba401c9e174dd4c824c321b23795816cbc90'
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/vmvarela/ghoten/releases/download/v#{version}/ghoten_#{version}_linux_amd64.tar.gz"
    sha256 'cee56ce9efd443f38ff8008c63bb801ee781c14690806c497aa2e11634bffc4b'
  elsif OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/vmvarela/ghoten/releases/download/v#{version}/ghoten_#{version}_linux_arm64.tar.gz"
    sha256 'b8268750c071bc31eed56f59ba4003ec2d480bcde57b63845d75828a81c2f502'
  else
    odie 'Unsupported platform! ghoten supports macOS (Intel/Apple Silicon) and Linux (amd64/arm64).'
  end

  def install
    bin.install 'ghoten'
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ghoten version")
  end
end
