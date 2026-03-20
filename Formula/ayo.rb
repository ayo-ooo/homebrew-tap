class Ayo < Formula
  desc "CLI tool for building AI agents with structured inputs and outputs"
  homepage "https://github.com/ayo-ooo/ayo"
  version "0.1.3"
  license "MIT"

  url "https://github.com/ayo-ooo/ayo/archive/refs/tags/v#{version}.tar.gz"
  sha256 "1bb2da003f1cd0fd91bd68cdb6d7f435e0056327a4f06360745b043827a5be20"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/ayo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ayo --version")
  end
end
