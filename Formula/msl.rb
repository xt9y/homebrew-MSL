class Msl < Formula
  desc "macOS Subsystem for Linux — run Arch Linux on Apple's Virtualization.framework"
  homepage "https://github.com/xt9y/msl"
  url "https://github.com/xt9y/msl/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "4ac53cd6440e3e1d7dcbb6030eb70e4237e605501f0cb30a23349d399f70802f"
  license "MIT"

  depends_on :macos
  depends_on xcode: ["15.0", :build]

  def install
    system "make"
    bin.install "build/msl"
  end

  test do
    system "#{bin}/msl", "--version"
  end
end
