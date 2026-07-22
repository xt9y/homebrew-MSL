class Msl < Formula
  desc "macOS Subsystem for Linux — run Arch Linux ARM via Virtualization.framework"
  homepage "https://github.com/xt9y/msl"
  url "https://github.com/xt9y/msl/archive/refs/tags/v0.7.22.tar.gz"
  sha256 "2aa015bd831169dd4ce836b2847dcdff48d2e26bd0f041c3b3f8127a705960bd"
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
