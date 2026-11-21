class Preen < Formula
  desc "Browse Markdown and diffs in the terminal"
  homepage "https://github.com/beatzball/preen"
  url "https://github.com/beatzball/preen/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "c5c827c86ce7947e0a1ee3be91509133445b1d43a78f260b93037c7270f08de0"
  license "MIT"

  depends_on "fzf"
  depends_on "git-delta"
  depends_on "glow"

  def install
    # The script resolves symlinks and reads VERSION from its parent directory.
    libexec.install "VERSION"
    (libexec/"bin").install "bin/preen"
    bin.install_symlink libexec/"bin/preen"
    pkgshare.install "themes/glow-roost.json"
  end

  test do
    assert_equal "preen #{version}", shell_output("#{bin}/preen --version").strip
  end
end
