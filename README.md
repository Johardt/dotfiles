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
You can [manage SSH keys](https://developer.1password.com/docs/ssh/manage-keys) and [sign git commits](https://developer.1password.com/docs/ssh/git-commit-signing) easily with 1Password.
This repo is set up in a way that requires you to create your own `~/.gitconfig.local` file.
In this file, paste your git name, email, and signingkey (which you get from 1Password), as well as additional configuration like path-dependant gitconfigs for separate environments (private and work, for example).

## Usage
I have built in some niceties into this config.
First off, you should use `brew add` and `brew remove` instead of `brew install` and `brew uninstall`. 
What this does is keep all of your packages in sync with a .Brewfile, from which all packages on your system can be managed. 
This way, you have a very declarative and reproducible setup.
