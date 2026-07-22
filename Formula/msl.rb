class Msl < Formula
  desc "macOS Subsystem for Linux — run Arch Linux ARM via Virtualization.framework"
  homepage "https://github.com/xt9y/msl"
  url "https://github.com/xt9y/msl/archive/refs/tags/v1.7.14.tar.gz"
  sha256 "390b6a78738b33cb6f4158459daecc9618722758d14bd9b947b33a3f75cb2349"
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
