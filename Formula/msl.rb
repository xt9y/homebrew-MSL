class Msl < Formula
  desc "macOS Subsystem for Linux — run Arch Linux ARM via Virtualization.framework"
  homepage "https://github.com/xt9y/msl"
  url "https://github.com/xt9y/msl/archive/refs/tags/v0.7.23.tar.gz"
  sha256 "cffc75f6fd6f9061f941b9a2fc3b623fb905149c852170277a5397f263f205b0"
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
