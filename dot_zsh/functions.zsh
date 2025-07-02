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
  local -a packages=()
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
        packages+=("$arg")
        ;;
    esac
  done

  if [[ ${#packages[@]} -eq 0 ]]; then
    echo "Usage: brew add <package>... [--cask|--formula]"
    return 1
  fi

  echo "➕ Adding ${#packages[@]} package(s) as $type to $brewfile..."
  
  # Add each package to the Brewfile
  for pkg in "${packages[@]}"; do
    echo "  - Adding $pkg..."
    if ! brew bundle add --file="$brewfile" --"$type" "$pkg"; then
      echo "❌ Failed to add $pkg"
      return 1
    fi
  done

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

# Command validation and highlighting setup
preexec() {
  # This function runs before each command
  # You can add custom logic here if needed
}

precmd() {
  # This function runs before each prompt
  # Set the terminal title to current directory
  print -Pn "\e]0;%n@%m: %~\a"
}

# Quick directory jumps
function mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Extract various archive formats
function extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2)   tar xjf "$1"     ;;
      *.tar.gz)    tar xzf "$1"     ;;
      *.bz2)       bunzip2 "$1"     ;;
      *.rar)       unrar e "$1"     ;;
      *.gz)        gunzip "$1"      ;;
      *.tar)       tar xf "$1"      ;;
      *.tbz2)      tar xjf "$1"     ;;
      *.tgz)       tar xzf "$1"     ;;
      *.zip)       unzip "$1"       ;;
      *.Z)         uncompress "$1"  ;;
      *.7z)        7z x "$1"        ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Find and kill process by name
function fkill() {
  local pid
  if [ "$UID" != "0" ]; then
    pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
  else
    pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
  fi

  if [ "x$pid" != "x" ]; then
    echo $pid | xargs kill -${1:-9}
  fi
}

# History management function
zshaddhistory() {
  local line=${1%%$'\n'}
  local cmd=${line%% *}
  
  # List of commands/patterns to exclude from history
  local -a excluded_patterns=(
    "aws *"
    "export *API*"
    "export *KEY*"
    "export *SECRET*"
    "export *TOKEN*"
    "export *PASSWORD*"
    "curl *key*"
    "curl *token*"
    "curl *password*"
    "mysql *-p*"
    "psql *:///*"
    "ssh *@*"
    "scp *@*"
    "rsync *@*"
    "wget *key*"
    "wget *token*"
    "history*"
    "fc *"
  )
  
  # Check if command matches any excluded pattern
  for pattern in "${excluded_patterns[@]}"; do
    if [[ $line == $~pattern ]]; then
      return 1  # Don't add to history
    fi
  done
  
  # Add to history
  return 0
}

# Git functions
function gfzf() {
  # Interactive git add using fzf
  git status --porcelain | fzf -m --preview 'git diff --color=always {2}' | awk '{print $2}' | xargs git add
}

function glfzf() {
  # Interactive git log using fzf
  git log --oneline --color=always | fzf --preview 'git show --color=always {1}' | awk '{print $1}' | xargs git show
}

# Better directory listing that shows git status
function lsg() {
  eza -la --color=always --group-directories-first --icons --git
}

# Quick project navigation
function proj() {
  local project_dir
  if [[ -d ~/Projects ]]; then
    project_dir=$(fd -t d -d 1 . ~/Projects | fzf --preview 'eza --tree --color=always {} | head -20')
    if [[ -n "$project_dir" ]]; then
      cd "$project_dir"
    fi
  else
    echo "~/Projects directory not found"
  fi
}

