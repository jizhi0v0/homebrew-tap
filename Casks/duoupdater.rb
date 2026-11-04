cask "duoupdater" do
  version "0.5.22"
  sha256 "629e88a7ef0e329620afbca4ff67e42ed2ecde2d63f519d26d482f0bb6559c8a"

  url "https://github.com/jizhi0v0/duo-updater/releases/download/v#{version}/DuoUpdater-#{version}-macos.zip"
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
    "~/Library/Saved Application State/com.duoupdater.app.savedState",
    "~/Library/WebKit/com.duoupdater.app",
  ]
end
