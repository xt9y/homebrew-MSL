class Msl < Formula
  desc "macOS Subsystem for Linux — run Arch Linux ARM via Virtualization.framework"
  homepage "https://github.com/xt9y/msl"
  url "https://github.com/xt9y/msl/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "4b4c33ffe342da7fa5ef9b888a6d4cc8919b18d200fd37580f3a1aa46502add6"
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