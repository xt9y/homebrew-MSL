class Msld < Formula
  desc "Guest daemon for msl (macOS Subsystem for Linux)"
  homepage "https://github.com/xt9y/msl"
  url "https://github.com/xt9y/MSL/archive/refs/tags/v1.4.3.tar.gz"
  sha256 "66ff3f327286e49732f9e3a83569d172dcfdb44161d5964c4a7182cefc78c13e"
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