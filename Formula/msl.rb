class Msl < Formula
  desc "macOS Subsystem for Linux — run Arch Linux ARM via Virtualization.framework"
  homepage "https://github.com/xt9y/msl"
  url "https://github.com/xt9y/msl/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "b464d626e29a5f169f6b3aba05fb0fc415bd473546b1a489cc2be9ad3115df33"
  license "MIT"

  depends_on xcode: ["15.0", :build]
  depends_on "xt9y/msl/msld"
  depends_on :macos

  def install
    ENV["SWIFTC"] = "xcrun swiftc"
    system "make", "sign"
    bin.install "build/msl"
  end

  test do
    system bin/"msl", "--version"
  end
end