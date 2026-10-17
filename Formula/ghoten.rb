# typed: false
# frozen_string_literal: true

# This formula consumes Ghoten's published release artifacts.
# Version and checksums must match a stable Ghoten release.

class Ghoten < Formula
  desc 'Thin OpenTofu distribution with Smart Refresh and native OCI state'
  homepage 'https://github.com/vmvarela/ghoten'
  version '1.13.1'
  license 'MPL-2.0'

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/vmvarela/ghoten/releases/download/v#{version}/ghoten_#{version}_darwin_amd64.tar.gz"
    sha256 '86b9754caf62e053c13f7e54c2adb8e1854926845f4e40ee391265fbc9b871f0'
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/vmvarela/ghoten/releases/download/v#{version}/ghoten_#{version}_darwin_arm64.tar.gz"
    sha256 '6a1b76fccab4e372fb142c5c2784fc81c598ea453471626b5bd990f946166b94'
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/vmvarela/ghoten/releases/download/v#{version}/ghoten_#{version}_linux_amd64.tar.gz"
    sha256 'f536b884d6e7282f9870d7d6164d046060df74c281186aededff3a7224eb0856'
  elsif OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/vmvarela/ghoten/releases/download/v#{version}/ghoten_#{version}_linux_arm64.tar.gz"
    sha256 '2cf36293d9574b18cc9057419203d18beab73f0071be736dc050d2e15206299f'
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
