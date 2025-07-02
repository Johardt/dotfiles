#!/bin/bash

# ----------------------------------------
# Cross-platform setup script
# ----------------------------------------

set -e

echo "🚀 Applying chezmoi configuration..."
chezmoi apply

echo "📦 Installing Homebrew packages from Brewfile..."
brew bundle install --file=~/.Brewfile

# Ensure macOS-specific setup script is executable
chmod +x scripts/setup-macos.sh

# Run macOS setup script
./scripts/setup-macos.sh

echo "✅ Setup complete."

