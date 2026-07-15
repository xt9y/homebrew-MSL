class Msl < Formula
  desc "macOS Subsystem for Linux — run Arch Linux ARM via Virtualization.framework"
  homepage "https://github.com/xt9y/msl"
  url "https://github.com/xt9y/msl/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "b8e4e8718c15d09869c867df2eb5a1b6ceb62e5397151f6b93188c1ca81d94ec"
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
