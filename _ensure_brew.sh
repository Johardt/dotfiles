#!/usr/bin/env bash

# Shared utility function to ensure Homebrew is available in the current session
# This file is sourced by installation scripts and should not be copied to home directory

ensure_brew() {
  # Check if brew is already available
  if command -v brew &> /dev/null; then
    return 0
  fi

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
    return 0
  else
    echo "Error: Homebrew installation not found at $BREW_PREFIX"
    return 1
  fi
}
