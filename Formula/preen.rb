class Preen < Formula
  desc "Browse Markdown and diffs in the terminal"
  homepage "https://github.com/beatzball/preen"
  url "https://github.com/beatzball/preen/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "f7fdacdea111eb4a354fd09fef728ed360f820b06b56003117201683b89ba482"
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
