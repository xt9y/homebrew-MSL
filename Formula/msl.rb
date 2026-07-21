class Msl < Formula
  desc "macOS Subsystem for Linux — run Arch Linux ARM via Virtualization.framework"
  homepage "https://github.com/xt9y/msl"
  url "https://github.com/xt9y/msl/archive/refs/tags/v1.6.0.tar.gz"
   sha256 "23d9347c4d07a1cb95e3f9f59bbd365860d70790751c7e1afa55ee12186a8430"
  license "MIT"

  depends_on xcode: ["15.0", :build]
  depends_on "xt9y/msl/msld"
  depends_on :macos

  def install
    ENV["SWIFTC"] = "xcrun swiftc"
    (buildpath/"Sources/Version.swift").write "import Foundation\nlet MSLVersion = \"#{version}\"\n"
    system "make", "sign"
    bin.install "build/msl"
  end

  test do
    system bin/"msl", "version"
  end
end