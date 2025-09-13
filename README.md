# Johardt's dotfiles
A curated collection for macOS developers who prioritize productivity and a clean aesthetic.

This setup uses chezmoi for configuration management and replaces traditional command-line tools with modern alternatives. It includes a complete development environment with editors, browsers, productivity apps, and fonts.

## Key components include:
  - Modern CLI tools like bat, eza, and ripgrep for improved functionality and performance.
  - Professional and modern applications such as Neovim, VS Code, Zed, the Ghostty terminal, and Zen browser.
  - Installation of nerd fonts optimal for development and CLI.
  - Automatic theme adaptation for light and dark modes.
  - Secure credential management via 1Password.
  - Modular and idempotent configuration for consistent setups.


## Installation

### Prerequisites

Before installing these dotfiles, you need to ensure that Xcode Command Line Tools are installed on your macOS system. These tools include `git` and other essential development utilities required by chezmoi and the dotfiles setup process.

**Install Xcode Command Line Tools first:**

```bash
xcode-select --install
```

This command will open a dialog asking you to install the command line developer tools. Click "Install" and wait for the installation to complete.

**Additional Requirements**: This dotfiles setup currently requires [1Password](https://1password.com/) for SSH key management and commit signing. Support for other password managers is planned for future releases.
1Password will be automatically installed during the setup process, but a 1Password account is required to complete the SSH integration.

### Quick Installation

Once the Command Line Tools are installed, execute the following command to initialize and apply the configuration:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply Johardt
```

And that's it! Although you will want to follow the instructions for the post-installation to complete the setup.
