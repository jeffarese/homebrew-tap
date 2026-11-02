class HerdrPool < Formula
  desc "Your machines as one pool for coding agents and test runs, on top of hc"
  homepage "https://github.com/jeffarese/herdr-pool"
  url "https://github.com/jeffarese/herdr-pool/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "3827c4c8c04e40ed6a795aa5a686ab6412700dbd273d30a7056b68e021b5bee6"
  license "MIT"
  head "https://github.com/jeffarese/herdr-pool.git", branch: "main"

  bottle do
    root_url "https://github.com/jeffarese/homebrew-tap/releases/download/herdr-pool-0.1.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "b37007eccba5bc516fcf8520ec7018c4eb77ed6d4141d675ae2a9ecfc367a2a5"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c396fec608303c74b801902a9a22a730dc6a94137c8d4bc9ff921f05dc942353"
    sha256 cellar: :any,                 x86_64_linux:  "be4a746606ef69d0501888f5d4d662ea2f0d9388db04b8d57c4042ebf5acb073"
  end

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
