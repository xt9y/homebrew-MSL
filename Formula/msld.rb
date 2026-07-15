class Msld < Formula
  desc "Guest daemon for msl (macOS Subsystem for Linux)"
  homepage "https://github.com/xt9y/msl"
  url "https://github.com/xt9y/MSL/archive/refs/tags/v1.4.2.tar.gz"
  sha256 "1dfe31318ab6372e39ff9d3c599d9c42c151bdcf4300ca98479e2bf04b950704"
  license "MIT"

  depends_on "filosottile/musl-cross/musl-cross" => "with-aarch64"
  depends_on :macos

  def install
    system "aarch64-linux-musl-gcc", "-static", "-Os", "-s", "-o", "msld", "Guest/msld.c"
    bin.install "msld"
  end

  def post_install
    chmod 0755, bin/"msld"
  end

  test do
    assert_predicate bin/"msld", :exist?
  end
end