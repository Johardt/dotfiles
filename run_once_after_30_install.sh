#!/bin/sh

# Install fisher and plugins inside fish
# TODO: This needs to be more structured. And also, shell won't find fish at this point. Needs a new session or re-sourcing
fish -c 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source; fisher install jorgebucaran/fisher jorgebucaran/autopair.fish; fisher install vitallium/tokyonight-fish'
