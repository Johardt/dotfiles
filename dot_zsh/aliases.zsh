alias cm=chezmoi
alias vi=nvim

# Optional: Replace brew install and brew uninstall with brew add and brew remove
brew() {
  local subcommand="$1"
  shift
  case "$subcommand" in
    install)
      _brew_add "$@"
      ;;
    uninstall)
      _brew_remove "$@"
      ;;
    # etc...
  esac
}
