class Msl < Formula
  desc "macOS Subsystem for Linux — run Arch Linux ARM via Virtualization.framework"
  homepage "https://github.com/xt9y/msl"
  url "https://github.com/xt9y/msl/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "292b301907058d2aa75cc001faaddf344deb7ec57b873bb2558a9a7ffd215a78"
  license "MIT"

  depends_on xcode: ["15.0", :build]
  depends_on :macos

  def install
    system "make"
    bin.install "build/msl"
    bin.install "build/msld" if File.exist?("build/msld")
    (share/"msl").install "Guest/msld.c"
  end

  def caveats
    <<~EOS
      The guest daemon (msld) requires aarch64-linux-musl-gcc to build:
        brew tap filosottile/musl-cross
        brew install musl-cross --with-aarch64
      Then run: brew reinstall msl && msl --setup
    EOS
  end

  test do
    system bin/"msl", "--version"
  end
end
