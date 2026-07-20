cask "stone-clipboarder-tool" do
  version "1.7.2"
  sha256 "60c4d7343125477cdbcd66d7f527b235ea5f0bdb3b118090200c7d5a19c197da"
  
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
