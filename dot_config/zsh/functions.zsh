function cx() {
  if [[ $# -eq 0 ]]; then
    cd ~
  elif [[ $# -eq 1 ]]; then
    cd "$1"
  else
    echo "Usage: cx [dir]"
    return 1
  fi

  # Only list if the directory change was successful
  if [[ $? -eq 0 ]]; then
    eza --color=always --group-directories-first --icons
  fi
}
