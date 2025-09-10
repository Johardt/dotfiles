# Johardt's dotfiles

A carefully curated collection of dotfiles designed for macOS developers who value productivity and aesthetics. This one-stop setup replaces traditional command-line tools with modern, feature-rich alternatives while providing a complete development environment including editors, browsers, productivity apps, and carefully selected fonts.

Built around [chezmoi](https://www.chezmoi.io/) for reliable configuration management, these dotfiles transform your entire development workflow with tools like `bat` instead of `cat`, `eza` for `ls`, `ripgrep` for `grep`, modern editors like Neovim and Zed, the Ghostty terminal, Zen browser, Raycast launcher, and optimized developer fonts.

## Features

- Complete developer environment setup with modern CLI tools, editors, terminal, browser, and productivity applications
- Modern CLI tools that enhance productivity with better defaults, syntax highlighting, and improved performance
- Professional development applications including Neovim, VS Code, Zed, Ghostty terminal, and Zen browser
- Productivity tools like Raycast for system management and workflow automation
- Carefully selected Nerd Fonts (JetBrains Mono, Geist Mono) optimized for coding
- Automatic light and dark theme adaptation that respects your system preferences
- Modular and extensible configuration designed to grow with your workflow
- Secure credential management through 1Password integration for SSH and Git operations
- Declarative and idempotent configuration ensuring consistent results across installations

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

## Post-Installation

### Required: Configure Git User Settings

A `.gitconfig.local` file will be created in your home directory with placeholder values. You **must** edit this file to add your personal git configuration:

```bash
# Edit the git local config file
nvim ~/.gitconfig.local
```

Update the following values:

- `email`: Your git email address
- `name`: Your full name
- `signingkey`: Your SSH public key for commit signing

### Required: Complete 1Password Integration

The git configuration is set up to use 1Password for SSH signing and authentication. You **must** complete the 1Password setup for git to work properly.

Follow the [instructions provided by 1Password](https://developer.1password.com/docs/ssh/get-started) to complete the SSH integration.
You should now have a .ssh/config file that looks like this:

```ini
Host *
  IdentityAgent "~/Libray/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
```

You can also add any further git profile orchestration you want to have in the `.gitconfig.local` file, like setting up a configuration for work and personal repositories:

```ini
[includeIf "gitdir:~/Projects/work/"]
  path = ~/Projects/work/.gitconfig
```

Finally, you need to set up GitHub / GitLab SSH keys for authentication and signing commits.
You can follow the instructions in the [GitHub documentation](https://docs.github.com/authentication/connecting-to-github-with-ssh).

**Note**: The current git configuration is hardcoded to use 1Password for SSH operations. Support for other password managers and more flexible configuration options is planned for future releases.

### Optional: Configure Raycast

Open Raycast and go to Settings > Advanced.
Select "Import" and choose `default.rayconfig` from the `~/.config` directory.
This will import the default configuration for Raycast, which includes various extensions and settings that enhance your productivity.
