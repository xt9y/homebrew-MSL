class Msld < Formula
  desc "Guest daemon for msl (macOS Subsystem for Linux)"
  homepage "https://github.com/xt9y/msl"
  url "https://github.com/xt9y/msl/archive/refs/tags/v1.5.2.tar.gz"
  sha256 "0c44304aac148ac4210391e617e049116443affee0ec1b59a0169bc7bb8551a5"
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