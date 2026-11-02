class HerdrPool < Formula
  desc "Your machines as one pool for coding agents and test runs, on top of hc"
  homepage "https://github.com/jeffarese/herdr-pool"
  url "https://github.com/jeffarese/herdr-pool/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "3827c4c8c04e40ed6a795aa5a686ab6412700dbd273d30a7056b68e021b5bee6"
  license "MIT"
  head "https://github.com/jeffarese/herdr-pool.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      Set up your machines and the agent skill for Claude Code with:
        herdr-pool init
      After an upgrade, refresh the agent skill with:
        herdr-pool skill install
    EOS
  end

  test do
    assert_match "herdr-pool #{version}", shell_output("#{bin}/herdr-pool --version")
    assert_match "least busy machine", shell_output("#{bin}/herdr-pool skill")
  end
end
