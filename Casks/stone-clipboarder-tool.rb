cask "stone-clipboarder-tool" do
  version "1.7.3"
  sha256 "f8720a7c0da16d7b036e678a90545bfac5e063ae48426765cef646319eb05f58"
  
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
