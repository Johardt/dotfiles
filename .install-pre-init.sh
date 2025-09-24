#!/usr/bin/env bash
set -euo pipefail

# Run only on macOS. Everywhere else: silence and exit.
if [[ "$(uname -s)" != "Darwin" ]]; then
  exit 0
fi

# 1) Install Homebrew if missing (official installer handles CLT)
if ! command -v brew >/dev/null 2>&1; then
  printf '%s\n' "Installing Homebrew…"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
    
# 2) Ensure brew is available in THIS process (Apple Silicon & Intel)
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
else
  echo "Homebrew not found after install attempt." >&2
  exit 1
fi

exit 0
