#!/bin/bash

echo "Installing Homebrew packages from .Brewfile..."
brew bundle install --file=~/.Brewfile

echo "Installation complete! Please restart your terminal or run 'reload' to reload your shell configuration."