cask "stone-clipboarder-tool" do
  version "1.10.1"
  sha256 "57f0598cb4e2fd09a8f6980a18e68b6d6f3587ae7eb08b72fefff8faf3744d62"
  
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
