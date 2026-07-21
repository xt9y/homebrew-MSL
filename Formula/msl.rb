class Msl < Formula
  desc "macOS Subsystem for Linux — run Arch Linux ARM via Virtualization.framework"
  homepage "https://github.com/xt9y/msl"
  url "https://github.com/xt9y/msl/archive/refs/tags/v1.6.0.tar.gz"
   sha256 "505a8b848c34ac7c94a89df1433fe75ba0f81d3b6165e6a1c6cfd20831dbf179"
  license "MIT"

  depends_on xcode: ["15.0", :build]
  depends_on "xt9y/msl/msld"
  depends_on :macos

  def install
    ENV["SWIFTC"] = "xcrun swiftc"
    system "echo 'import Foundation' > Sources/Version.swift && echo 'let MSLVersion = \"#{version}\"' >> Sources/Version.swift"
    system "make", "sign"
    bin.install "build/msl"
  end

  test do
    system bin/"msl", "version"
  end
end