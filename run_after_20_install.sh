#!/usr/bin/env bash

# Source the shared Homebrew utility
source "$(dirname "$0")/_ensure_brew.sh"

# Ensure Homebrew is available in the current session
if ! ensure_brew; then
  exit 1
fi

echo "Installing Homebrew packages from .Brewfile..."
brew bundle install --file=~/.Brewfile

echo "Installation complete! Please restart your terminal or run 'reload' to reload your shell configuration."
