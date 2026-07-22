class Msl < Formula
  desc "macOS Subsystem for Linux — run Arch Linux ARM via Virtualization.framework"
  homepage "https://github.com/xt9y/msl"
  url "https://github.com/xt9y/msl/archive/refs/tags/v1.7.17.tar.gz"
  sha256 "a70a22e1ac48ca9de98079d7bd83188b65631400e0fd2f6df190db0654fe7658"
  license "MIT"

  depends_on xcode: ["15.0", :build]
  depends_on "xt9y/msl/msld"
  depends_on :macos

  def install
    ENV["SWIFTC"] = "xcrun swiftc"
    system "make", "sign"
    bin.install "build/msl"
    (share/"msl").install "Resources/msl.entitlements"
  end

  test do
    system bin/"msl", "version"
  end
end
