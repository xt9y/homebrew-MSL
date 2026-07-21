class Msld < Formula
  desc "Guest daemon for msl (macOS Subsystem for Linux)"
  homepage "https://github.com/xt9y/msl"
  url "https://github.com/xt9y/msl/archive/refs/tags/v1.5.11.tar.gz"
  sha256 "909f59623f2e4e13920aab408449434e00cf997634f8fcd0114b1187491699dd"
  license "MIT"

  depends_on "zig"
  depends_on :macos

  def install
    system "zig", "cc", "-target", "aarch64-linux-musl", "-static", "-Os", "-s", "-o", "msld", "Guest/msld.c"
    bin.install "msld"
  end

  test do
    assert_predicate bin/"msld", :exist?
  end
end