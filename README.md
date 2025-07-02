# Johardt-Dotfiles

This is my setup to manage configurations and packages on my system.  
It is built for macOS, but most options should work on Linux.

## Installation
To get started, first install [brew](https://brew.sh/).
This will also install xcode-cli-tools if necessary.
Afterwards, use brew to install [chezmoi](https://www.chezmoi.io/) using `brew install chezmoi`
and initialize it using `chezmoi init git@github.com:Johardt/dotfiles.git` and apply the configuration with `chezmoi apply`.  

## Setup
This setup uses and installs 1password.
You can [manage SSH keys](https://developer.1password.com/docs/ssh/manage-keys) and [sign git commits] easily with 1Password.

