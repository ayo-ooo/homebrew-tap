class Ayo < Formula
  desc "CLI tool for building AI agents with structured inputs and outputs"
  homepage "https://github.com/ayo-ooo/ayo"
  version "0.1.7"
  license "MIT"

  url "https://github.com/ayo-ooo/ayo/archive/refs/tags/v#{version}.tar.gz"
  sha256 "686a70758e6f51a632fe2c68b687050ea53ff5e40eef36ea8a365e69234d6c53"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/ayo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ayo --version")
  end
end
