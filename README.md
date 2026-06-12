# Homebrew Taps

![from macOS 15](https://img.shields.io/badge/macOS-15.0+-blue.svg) <br>

A Homebrew tap containing custom casks (macOS apps) and formulae (CLI tools).

## Installation

### Homebrew (macOS)
```bash
brew tap foxfollow/stone

# Cask — Stone Clipboarder Tool (.app)
brew install stone-clipboarder-tool

# Formula — remote-launcher (CLI)
brew install remote-launcher
```

The app will be automatically configured to run without security warnings.

### remote-launcher

Run Claude Code on your Mac while executing every Bash command on a remote
Linux host via SSH. After install, check your setup:

```bash
remote-launcher-doctor            # file/PATH checks
remote-launcher-doctor <ssh-host> # also test a live SSH round-trip
```

`remote-launcher` drives the [Claude Code](https://docs.claude.com/en/docs/claude-code)
CLI (`claude`), which is not available via Homebrew — install it separately.

### Manual Download
Download the latest `.zip` from [Releases](https://github.com/foxfollow/Stone-Clipboarder-Tool/releases)

If macOS blocks the app on first launch:
```bash
xattr -d com.apple.quarantine /Applications/StoneClipboarderTool.app
```


## More Information

- [Stone Clipboarder Tool on GitHub](https://github.com/foxfollow/Stone-Clipboarder-Tool)
- [remote-launcher on GitHub](https://github.com/foxfollow/remote-launcher)
