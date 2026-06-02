# Johardt's dotfiles

## Installation

### Prerequisites

Before installing these dotfiles, you need to ensure that Xcode Command Line Tools are installed on your macOS system. These tools include `git` and other essential development utilities required by chezmoi and the dotfiles setup process.

**Install Xcode Command Line Tools first:**

```bash
xcode-select --install
```

This command will open a dialog asking you to install the command line developer tools. Click "Install" and wait for the installation to complete.

### Quick Installation

Once the Command Line Tools are installed, execute the following command to initialize and apply the configuration:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply Johardt
```

And that's it! Although you will want to follow the instructions for the [post-installation](https://github.com/Johardt/dotfiles/wiki/Installation#post-installation) to complete the setup.
