class Preen < Formula
  desc "Browse Markdown and diffs in the terminal"
  homepage "https://github.com/beatzball/preen"
  url "https://github.com/beatzball/preen/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "ef6e594e66b242b48a17064e9abbeecf281d5d760cbd5ba2d53aa390b449850f"
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
