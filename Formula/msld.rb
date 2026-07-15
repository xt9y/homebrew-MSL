class Msld < Formula
  desc "Guest daemon for msl (macOS Subsystem for Linux)"
  homepage "https://github.com/xt9y/msl"
  url "https://github.com/xt9y/msl/archive/refs/tags/v1.1.13.tar.gz"
  sha256 "63f1e8b6df2764b9d65dda4dc0990305923d73eaed5ceb743a5893a4e4eebdf9"
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