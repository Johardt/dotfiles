#!/bin/bash

# ----------------------------------------
# Cross-platform setup script
# ----------------------------------------

set -e

echo "🚀 Applying chezmoi configuration..."
chezmoi apply

echo "📦 Installing Homebrew packages from Brewfile..."
brew bundle install --file=~/.Brewfile

# Check if running on macOS
if [[ "$(uname)" == "Darwin" ]]; then
  echo "🍎 Detected macOS – executing macOS-specific setup..."

  # Ensure macOS-specific setup script is executable
  chmod +x scripts/setup-macos.sh

  # Run macOS setup script
  ./scripts/setup-macos.sh
else
  echo "🛑 Not running on macOS. Skipping macOS-specific setup."
fi

echo "✅ Setup complete."

