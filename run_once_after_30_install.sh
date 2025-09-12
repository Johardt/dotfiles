#!/usr/bin/env bash

# Install fisher and plugins inside fish
# This script runs after Homebrew packages are installed

set -e  # Exit on any error

# Source the shared Homebrew utility
source "$(dirname "$0")/_ensure_brew.sh"

echo "Setting up fish shell plugins..."

# Ensure Homebrew is available in the current session
if ! ensure_brew; then
  exit 1
fi

# Check if fish is available
if ! command -v fish &> /dev/null; then
  echo "Error: fish shell not found in PATH. Make sure it's installed via Homebrew."
  echo "Current PATH: $PATH"
  exit 1
fi

echo "Found fish at: $(which fish)"

# Install fisher and plugins
echo "Installing fisher and fish plugins..."

# Use fish to install fisher and plugins in a more structured way
fish -c '
# Install fisher if not already installed
if not functions -q fisher
  echo "Installing fisher..."
  curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source

  # Install fisher itself first
  fisher install jorgebucaran/fisher
else
  echo "Fisher already installed"
end

# Install plugins
echo "Installing fish plugins..."
fisher install jorgebucaran/autopair.fish
fisher install vitallium/tokyonight-fish

echo "Fish plugins installation complete!"
'

echo "Fish setup completed successfully!"
echo "Note: You may need to restart your terminal or start a new fish session to see all changes."
