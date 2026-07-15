class Msld < Formula
  desc "Guest daemon for msl (macOS Subsystem for Linux)"
  homepage "https://github.com/xt9y/msl"
  url "https://github.com/xt9y/msl/archive/refs/tags/v1.0.4.tar.gz"
  sha256 "53d9278a7b38d46cb575e3d96e410e16a10422e939db3f601e48f0a1a8c9db5a"
  license "MIT"

  depends_on "filosottile/musl-cross/musl-cross" => "with-aarch64"
  depends_on :macos

  def install
    system "aarch64-linux-musl-gcc", "-static", "-Os", "-s", "-o", "msld", "Guest/msld.c"
    chmod 0755, "msld"
    bin.install "msld"
  end

  test do
    assert_predicate bin/"msld", :exist?
  end
end