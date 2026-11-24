class Preen < Formula
  desc "Browse Markdown and diffs in the terminal"
  homepage "https://github.com/beatzball/preen"
  url "https://github.com/beatzball/preen/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "bd80f0749e11cff5e48b02a29473f0a8f7ac304deeb734b5db80d43f1e42e191"
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
