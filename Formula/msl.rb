class Msl < Formula
  desc "macOS Subsystem for Linux — runs Arch Linux ARM via Virtualization.framework"
  homepage "https://github.com/xt9y/msl"
  url "https://github.com/xt9y/msl/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "538ae44348c7ef2dcacfbd5d59fe89e64a855694f7c292d41486c5b96e891e45"
  license "MIT"

  depends_on :macos
  depends_on xcode: ["15.0", :build]
  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build",
           "-DCMAKE_BUILD_TYPE=Release",
           "-DCMAKE_OSX_DEPLOYMENT_TARGET=14.0"
    system "cmake", "--build", "build"
    bin.install "build/msl"
  end

  test do
    system "#{bin}/msl", "version"
  end
end
