# Optimized NVM configuration with lazy loading
export NVM_DIR="$HOME/.nvm"

# Determine Homebrew prefix based on system architecture
if [[ "$(uname -m)" == "arm64" ]]; then
  BREW_PREFIX="/opt/homebrew"
else
  BREW_PREFIX="/usr/local"
fi

# Lazy load NVM - only initialize when needed
nvm() {
    unfunction nvm
    echo "🔄 Loading NVM (first use)..."
    [ -s "$BREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$BREW_PREFIX/opt/nvm/nvm.sh"
    [ -s "$BREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$BREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"
    nvm "$@"
}

# Alias node/npm commands to trigger NVM loading
node() {
    unfunction node
    nvm > /dev/null 2>&1  # This will trigger the lazy loading
    node "$@"
}

npm() {
    unfunction npm
    nvm > /dev/null 2>&1  # This will trigger the lazy loading
    npm "$@"
}

npx() {
    unfunction npx
    nvm > /dev/null 2>&1  # This will trigger the lazy loading
    npx "$@"
}

# Add nvm's default node to PATH if it exists (for immediate use without loading)
if [ -d "$NVM_DIR/versions/node" ]; then
    # Get the default or latest version
    if [ -f "$NVM_DIR/alias/default" ]; then
        DEFAULT_VERSION=$(cat "$NVM_DIR/alias/default")
    else
        DEFAULT_VERSION=$(ls "$NVM_DIR/versions/node" | sort -V | tail -n1)
    fi
    
    if [ -d "$NVM_DIR/versions/node/$DEFAULT_VERSION/bin" ]; then
        export PATH="$NVM_DIR/versions/node/$DEFAULT_VERSION/bin:$PATH"
    fi
fi
