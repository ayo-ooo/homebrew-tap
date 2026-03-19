class Ayo < Formula
  desc "CLI tool for building AI agents with structured inputs and outputs"
  homepage "https://github.com/ayo-ooo/ayo"
  version "0.1.1"
  license "MIT"

  url "https://github.com/ayo-ooo/ayo/archive/refs/tags/v#{version}.tar.gz"
  sha256 "ba5051254a882830867cca7751c66382d3fdc9d961921beaa03f639ed6be56a0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/ayo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ayo --version")
  end
end
