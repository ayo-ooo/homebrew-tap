# typed: false
# frozen_string_literal: true

class Ayo < Formula
  desc "CLI tool for building AI agents with structured inputs and outputs"
  homepage "https://github.com/ayo-ooo/ayo"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ayo-ooo/ayo/archive/refs/tags/v#{version}.tar.gz"
      sha256 "ae51936325465234e065083f8fcb6950a562880d2593834f8d50a82f4308a92d"

      depends_on "go" => :build
    end

    on_intel do
      url "https://github.com/ayo-ooo/ayo/archive/refs/tags/v#{version}.tar.gz"
      sha256 "ae51936325465234e065083f8fcb6950a562880d2593834f8d50a82f4308a92d"

      depends_on "go" => :build
    end
  end

  on_linux do
    url "https://github.com/ayo-ooo/ayo/archive/refs/tags/v#{version}.tar.gz"
    sha256 "ae51936325465234e065083f8fcb6950a562880d2593834f8d50a82f4308a92d"

    depends_on "go" => :build
  end

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/ayo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ayo --version")
  end
end
