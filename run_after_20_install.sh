#!/bin/bash

# Ensure Homebrew is available in the current session
if ! command -v brew &> /dev/null; then
  echo "Setting up Homebrew environment..."
  
  # Detect Homebrew prefix based on architecture
  if [[ "$(uname -m)" == "arm64" ]]; then
    export BREW_PREFIX="/opt/homebrew"
  else
    export BREW_PREFIX="/usr/local"
  fi
  
  # Source Homebrew environment if it exists
  if [[ -x "$BREW_PREFIX/bin/brew" ]]; then
    eval "$($BREW_PREFIX/bin/brew shellenv)"
    echo "Homebrew environment loaded."
  else
    echo "Error: Homebrew installation not found at $BREW_PREFIX"
    exit 1
  fi
fi

echo "Installing Homebrew packages from .Brewfile..."
brew bundle install --file=~/.Brewfile

echo "Installation complete! Please restart your terminal or run 'reload' to reload your shell configuration."