#!/bin/sh

# Install fisher and plugins inside fish
fish -c 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source; fisher install jorgebucaran/fisher jorgebucaran/autopair.fish; fisher install vitallium/tokyonight-fish'
