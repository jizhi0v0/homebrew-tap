cask "duoupdater" do
  version "0.5.5"
  sha256 "d7d9545ffab0a0658bc6b8dac7c14a183de99cb75cde7c30c615d092b8fd1195"

  url "https://github.com/jizhi0v0/duo-updater/releases/download/v#{version}/DuoUpdater-#{version}-macos.zip",
      verified: "github.com/jizhi0v0/duo-updater/"
  name "DuoUpdater"
  desc "Keep apps and command-line tools up to date from the menu bar"
  homepage "https://duoupdater.app/"

  livecheck do
    url "https://updates.duoupdater.app/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sequoia

  app "DuoUpdater.app"

  uninstall launchctl: "com.duoupdater.helper",
            quit:      "com.duoupdater.app"

  zap trash: [
    "~/Library/Application Support/com.duoupdater.app",
    "~/Library/Application Support/DuoUpdater",
    "~/Library/Caches/com.duoupdater.app",
    "~/Library/Caches/com.duoupdater.app.sparkle",
    "~/Library/Caches/com.duoupdater.cli",
    "~/Library/Caches/duo-updater",
    "~/Library/HTTPStorages/com.duoupdater.app",
    "~/Library/HTTPStorages/com.duoupdater.app.binarycookies",
    "~/Library/HTTPStorages/com.duoupdater.cli",
    "~/Library/HTTPStorages/com.duoupdater.cli.binarycookies",
    "~/Library/Preferences/com.duoupdater.app.plist",
    "~/Library/WebKit/com.duoupdater.app",
  ]
end
