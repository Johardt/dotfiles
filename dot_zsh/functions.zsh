brew() {
  local subcommand="$1"
  shift

  case "$subcommand" in
    add)
      _brew_add "$@"
      ;;
    remove)
      _brew_remove "$@"
      ;;
    *)
      command brew "$subcommand" "$@"
      ;;
  esac
}

_brew_add() {
  local brewfile="$HOME/.Brewfile"
  local pkg=""
  local type="formula"

  # Parse args
  for arg in "$@"; do
    case "$arg" in
      --cask)
        type="cask"
        ;;
      --formula)
        type="formula"
        ;;
      -*)
        echo "Unknown flag: $arg"
        return 1
        ;;
      *)
        if [[ -z "$pkg" ]]; then
          pkg="$arg"
        else
          echo "Unexpected extra argument: $arg"
          return 1
        fi
        ;;
    esac
  done

  if [[ -z "$pkg" ]]; then
    echo "Usage: brew add <package> [--cask|--formula]"
    return 1
  fi

  echo "➕ Adding $pkg as $type to $brewfile..."
  brew bundle add --file="$brewfile" --"$type" "$pkg" || {
    echo "❌ Failed to add $pkg"
    return 1
  }

  echo "🔧 Installing new Brewfile dependencies..."
  # Capture install summary
  local output
  if ! output=$(brew bundle install --file="$brewfile" 2>&1); then
    echo "$output"
    return 1
  fi

  # Only show summary of installed items
  local installed
  installed=$(echo "$output" | grep -E '^Using ' -v | grep -E 'Installing ')

  if [[ -z "$installed" ]]; then
    echo "✅ No new packages were installed."
  else
    local count
    count=$(echo "$installed" | wc -l | tr -d ' ')
    echo "📦 Installed $count new package(s):"
    echo "$installed"
  fi

  echo "📂 Updating chezmoi with .Brewfile..."
  chezmoi re-add "$brewfile"
}

_brew_remove() {
  local pkg="$1"
  local brewfile="$HOME/.Brewfile"

  if [[ -z "$pkg" ]]; then
    echo "Usage: brew remove <package>"
    return 1
  fi

  if grep -qE "(brew|cask)\s+\"$pkg\"" "$brewfile"; then
    echo "➖ Removing $pkg from $brewfile..."
    sed -i '' "/\(brew\|cask\)\s\+\"$pkg\"/d" "$brewfile"
  else
    echo "⚠️  $pkg not found in $brewfile"
  fi

  read "uninstall?Do you also want to uninstall $pkg from the system? [y/N] "
  if [[ "$uninstall" =~ ^[Yy]$ ]]; then
    echo "🧹 Uninstalling $pkg..."
    brew uninstall "$pkg" || echo "⚠️ Failed to uninstall $pkg"
  fi

  echo "📂 Updating chezmoi with .Brewfile..."
  chezmoi re-add "$brewfile"
}

