class RemoteLauncher < Formula
  desc "Run Claude Code locally while executing Bash on a remote host via SSH"
  homepage "https://github.com/foxfollow/remote-launcher"
  url "https://github.com/foxfollow/remote-launcher/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "e660c199c44f3f44345d3b68a61a6eb1ad1a5e4d932a077061fcd3ab3b867ba9"
  license "MIT"

  def install
    # remote-launcher / ssh-shell resolve their siblings (prompts/, the
    # ssh-shell-bash symlink) relative to their own on-disk location, so the
    # whole tree has to stay together. Keep it in libexec and expose thin
    # wrappers on PATH that exec the real scripts by ABSOLUTE path — the
    # scripts' symlink-walk doesn't cope with Homebrew's relative bin symlinks.
    libexec.install "bin", "prompts", "skill"
    libexec.install "README.md", "LICENSE", "CHANGELOG.md"

    # The scripts read their version from PROJECT_DIR/VERSION. Write it from the
    # formula's own version (derived from the url tag) so it's always correct
    # and independent of whether the source tarball ships a VERSION file.
    (libexec/"VERSION").write "#{version}\n"

    %w[remote-launcher remote-launcher-doctor].each do |exe|
      (bin/exe).write <<~SH
        #!/bin/bash
        exec "#{libexec}/bin/#{exe}" "$@"
      SH
    end
  end

  def caveats
    <<~EOS
      remote-launcher drives the Claude Code CLI, so you also need `claude`
      on your PATH (not available via Homebrew):
        https://docs.claude.com/en/docs/claude-code

      To enable the bundled Claude Code skill, link it into your skills dir:
        mkdir -p "$HOME/.claude/skills/remote-launcher"
        ln -sf "#{opt_libexec}/skill/SKILL.md" \\
               "$HOME/.claude/skills/remote-launcher/SKILL.md"

      Verify the install (optionally against an SSH host):
        remote-launcher-doctor
        remote-launcher-doctor <ssh-host>
    EOS
  end

  test do
    # --help prints the usage header and exits 0 without needing `claude`.
    assert_match "Usage", shell_output("#{bin}/remote-launcher --help")
    assert_match "remote-launcher-doctor", shell_output("#{bin}/remote-launcher-doctor --help")
  end
end
