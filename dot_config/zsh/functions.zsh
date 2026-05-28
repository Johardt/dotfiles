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

function kubeconfig-load() {
  local configs
  configs=(~/.kube/*.(yml|yaml)(N))
  export KUBECONFIG="${(j/:/)configs}"

  kubectx
}
alias kcfg='kubeconfig-load'

function kunset() {
    export KUBECONFIG=/dev/null
    echo "KUBECONFIG disabled"
}
