class Msld < Formula
  desc "Guest daemon for msl (macOS Subsystem for Linux)"
  homepage "https://github.com/xt9y/msl"
  url "https://github.com/xt9y/msl/archive/refs/tags/v1.0.5.tar.gz"
  sha256 "c0fa23f8455b3ebd867ed1712b2da6ab21191d7aa71ed2c43f65fb1b996b0445"
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