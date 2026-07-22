class Msld < Formula
  desc "Guest daemon for msl (macOS Subsystem for Linux)"
  homepage "https://github.com/xt9y/msl"
  url "https://github.com/xt9y/msl/archive/refs/tags/v0.7.30.tar.gz"
  sha256 "2a6fb1ada8b982973811a3dce6c0488bf3e8711f64741ad30c3b87e542c59749"
  license "MIT"

  depends_on "zig"
  depends_on :macos

  def install
    system "zig", "cc", "-target", "aarch64-linux-musl", "-static", "-Os", "-s", "-o", "msld", "Guest/msld.c"
    system "chmod", "+x", "msld"
    bin.install "msld"
  end

  test do
    assert_predicate bin/"msld", :exist?
  end
end
