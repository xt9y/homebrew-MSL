class Msld < Formula
  desc "Guest daemon for msl (macOS Subsystem for Linux)"
  homepage "https://github.com/xt9y/msl"
  url "https://github.com/xt9y/msl/archive/refs/tags/v1.5.5.tar.gz"
  sha256 "8e3f815c6be8e31d3abc1602006a92406c29d0b4ce7ab8b235e857b4c8b7aad7"
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