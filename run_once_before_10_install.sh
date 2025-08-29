#!/bin/bash

# Install Homebrew if not already installed
if ! command -v brew &> /dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  
  # Set up Homebrew environment for the current session
  if [[ "$(uname -m)" == "arm64" ]]; then
    export BREW_PREFIX="/opt/homebrew"
  else
    export BREW_PREFIX="/usr/local"
  fi
  
  # Source Homebrew environment
  eval "$($BREW_PREFIX/bin/brew shellenv)"
  
  echo "Homebrew installed successfully. PATH updated for current session."
fi