cask "stone-clipboarder-tool" do
  version "1.5.4"
  sha256 "d3d7dc45e68a8c8a3cf840f657cef6e5be7496bf382500fed576729ec8498f5c"
  
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
