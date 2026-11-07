cask "stone-clipboarder-tool" do
  version "1.9.0"
  sha256 "87c5cf489a3ef286bb2b047b4d59c7b262bca627bb90b39ca9387cf414505a8c"
  
  url "https://github.com/foxfollow/Stone-Clipboarder-Tool/releases/download/v#{version}/StoneClipboarderTool.zip"
  name "Stone Clipboarder Tool"
  desc "Clipboard manager with search and history"
  homepage "https://github.com/foxfollow/Stone-Clipboarder-Tool"
  
  app "StoneClipboarderTool.app"
  
  postflight do
    system_command "xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/StoneClipboarderTool.app"],
                   sudo: false
  end
  
  zap trash: [
    "~/Library/Application Support/StoneClipboarderTool",
    "~/Library/Preferences/d3f0ld.StoneClipboarderTool.plist",
    "~/Library/Caches/d3f0ld.StoneClipboarderTool",
  ]
end
