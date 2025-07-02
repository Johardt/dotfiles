brew_add() {
  if [ "$#" -eq 0 ]; then
    echo "Usage: brew_add <package> [formula|cask]"
    return 1
  fi

  local pkg="$1"
  local type="${2:-formula}"  # default to formula
  local brewfile="$HOME/.Brewfile"
  local cmd="brew"

  if [[ "$type" == "cask" ]]; then
    cmd="cask"
  elif [[ "$type" != "formula" ]]; then
    echo "Invalid type: $type. Use 'formula' or 'cask'."
    return 1
  fi

  echo "➕ Adding $pkg as $cmd to $brewfile..."
  brew bundle add --describe --file="$brewfile" "$pkg" --"$type" || {
    echo "❌ Failed to add $pkg"
    return 1
  }

  echo "🔧 Installing all Brewfile dependencies..."
  brew bundle install --file="$brewfile"

  echo "📦 Updating chezmoi with .Brewfile..."
  chezmoi re-add "$brewfile"
}


brew_remove() {
  if [ -z "$1" ]; then
    echo "Usage: brew_remove <package>"
    return 1
  fi

  local pkg="$1"
  local brewfile="$HOME/.Brewfile"

  # Remove from Brewfile (if present)
  if grep -qE "(brew|cask)\\s+\"$pkg\"" "$brewfile"; then
    echo "➖ Removing $pkg from $brewfile..."
    # Use sed to delete matching line
    sed -i '' "/\\(brew\\|cask\\)\\s\\+\"$pkg\"/d" "$brewfile"
  else
    echo "⚠️  $pkg not found in $brewfile"
  fi

  # Ask user whether to uninstall
  read "uninstall?Do you also want to uninstall $pkg from the system? [y/N] "
  if [[ "$uninstall" =~ ^[Yy]$ ]]; then
    echo "🧹 Uninstalling $pkg..."
    brew uninstall "$pkg" || echo "⚠️ Failed to uninstall $pkg"
  fi

  echo "📦 Updating chezmoi with .Brewfile..."
  chezmoi re-add "$brewfile"
}

