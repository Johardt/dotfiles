set -x EDITOR hx
set -x PAGER bat
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -gx BREW_PREFIX (brew --prefix)
set -x HOMEBREW_NO_ENV_HINTS 1
set -g fish_greeting ''
set -x FZF_DEFAULT_COMMAND 'fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
set -x FZF_DEFAULT_OPTS '
  --height 40%
  --layout=reverse
  --border=rounded
  --preview "bat --color=always --style=numbers --line-range=:500 {}"
  --preview-window=right:60%:wrap
  --bind="ctrl-u:preview-page-up,ctrl-d:preview-page-down"
'
set -x FZF_CTRL_R_OPTS '
  --preview "echo {} | bat --language=fish --style=plain --color=always"
  --preview-window=up:3
'