class Ayo < Formula
  desc "CLI tool for building AI agents with structured inputs and outputs"
  homepage "https://github.com/ayo-ooo/ayo"
  version "0.1.4"
  license "MIT"

  url "https://github.com/ayo-ooo/ayo/archive/refs/tags/v#{version}.tar.gz"
  sha256 "753b32468353a374a0d5218d1e3d8932e58468f0c3f22a0716699d478dce13d5"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/ayo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ayo --version")
  end
end
