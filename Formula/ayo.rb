class Ayo < Formula
  desc "CLI tool for building AI agents with structured inputs and outputs"
  homepage "https://github.com/ayo-ooo/ayo"
  version "0.1.6"
  license "MIT"

  url "https://github.com/ayo-ooo/ayo/archive/refs/tags/v#{version}.tar.gz"
  sha256 "f207bc427e7d2aae09dfacef7191332b10f78e4fcf0e5c737370599a7669797a"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/ayo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ayo --version")
  end
end
