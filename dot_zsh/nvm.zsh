export NVM_DIR="$HOME/.nvm"

# Determine Homebrew prefix based on system architecture
if [[ "$(uname -m)" == "arm64" ]]; then
  BREW_PREFIX="/opt/homebrew"
else
  BREW_PREFIX="/usr/local"
fi

# Source nvm and bash_completion if available
[ -s "$BREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$BREW_PREFIX/opt/nvm/nvm.sh"
[ -s "$BREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$BREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"
