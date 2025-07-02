#!/bin/bash

# ----------------------------------------
# Mac Setup Script: Dock and Browser Config
# ----------------------------------------

# Exit on any error
set -e

echo "🔧 Applying macOS configuration..."

# Check for dockutil
if ! command -v dockutil &>/dev/null; then
  echo "❌ dockutil is not installed. Install it via Homebrew: brew install dockutil"
  exit 1
fi

# Check for duti
if ! command -v duti &>/dev/null; then
  echo "❌ duti is not installed. Install it via Homebrew: brew install duti"
  exit 1
fi

echo "🧹 Cleaning up Dock entries..."

# Remove all apps (except Finder, Trash stays by default)
dockutil --remove all --no-restart

echo "📌 Adding desired apps to the Dock in specified order..."

# Left side (apps)
# dockutil --add /System/Library/CoreServices/Finder.app --no-restart
dockutil --add /Applications/Zen.app --no-restart
dockutil --add /Applications/Ghostty.app --no-restart
dockutil --add /Applications/Visual\ Studio\ Code.app --no-restart
dockutil --add /System/Applications/Mail.app --no-restart
dockutil --add /System/Applications/Calendar.app --no-restart
dockutil --add /System/Applications/Notes.app --no-restart

# Right side (folders, after separator)
echo "📂 Adding Downloads stack to the right side of the Dock..."

dockutil --add ~/Downloads --view fan --display folder --sort dateadded --section others --no-restart

echo "⚙️ Applying Dock preferences..."

# Automatically hide the Dock
defaults write com.apple.dock autohide -bool true

# Disable recently used applications in the Dock
defaults write com.apple.dock show-recents -bool false

# Restart Dock to apply all changes
killall Dock

echo "🌐 Setting Zen as default browser..."

# Set Zen as default handler for http and https using duti
duti -s app.zen-browser.zen http
duti -s app.zen-browser.zen https

echo "✅ Dock and browser configuration completed successfully."

