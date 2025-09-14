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

# 3) Install 1Password GUI app and CLI (idempotent)
need=()
brew list --cask 1password >/dev/null 2>&1     || need+=(1password)
brew list --cask 1password-cli >/dev/null 2>&1 || need+=(1password-cli)

if ((${#need[@]})); then
  echo "Installing casks: ${need[*]} …"
  brew install --cask "${need[@]}"
fi

# 4) Prove the CLI is ready (best-effort; do not fail here)
if command -v op >/dev/null 2>&1; then
  op --version >/dev/null || true
fi

exit 0
