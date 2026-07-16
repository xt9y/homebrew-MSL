class Msld < Formula
  desc "Guest daemon for msl (macOS Subsystem for Linux)"
  homepage "https://github.com/xt9y/msl"
  url "https://github.com/xt9y/msl/archive/refs/tags/v1.5.4.tar.gz"
  sha256 "910ac1e671014a9266f1634c78594d911bd4d232d846f46ae00c69d152707770"
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