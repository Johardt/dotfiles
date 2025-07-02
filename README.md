# Johardt-Dotfiles

A powerful, modern macOS development environment that strives to be minimal and reproducible.

## Installation

### Prerequisites

1. Install [Homebrew](https://brew.sh/)
2. Install chezmoi: `brew install chezmoi`

### Setup

```bash
# Initialize dotfiles
chezmoi init git@github.com:Johardt/dotfiles.git

# Navigate to chezmoi directory
cd ~/.local/share/chezmoi

# Run the complete setup
./setup.sh
```

## Usage & Shortcuts

### **Navigation**

```bash
# Smart directory jumping (remembers frequently used paths)
z ~/Projects          # Jump to Projects directory
zi                     # Interactive directory picker with fzf
z -                    # Go back to previous directory

# Modern file listings
ls                     # Beautiful file listing with icons
ll                     # Detailed listing with git status
lt                     # Tree view
lsd                    # Directories only
```

### **Fuzzy Finding**

```bash
# In terminal, use these shortcuts:
Ctrl+R                 # Fuzzy search command history
Ctrl+T                 # Fuzzy find files to insert into command
Alt+C                  # Fuzzy find directories to cd into

# Custom functions:
proj                   # Navigate to projects with fzf
gfzf                   # Interactive git add with preview
glfzf                  # Interactive git log browser
fkill                  # Find and kill processes interactively
```

### **Package Management**

```bash
# Enhanced Homebrew commands
brew add zoxide fzf    # Add multiple packages and sync Brewfile
brew remove package    # Remove from Brewfile with optional uninstall
brew add --cask docker # Add GUI applications
```

### **Terminal Shortcuts (Ghostty)**

- `Cmd+T` - New tab
- `Cmd+D` - Split right
- `Cmd+Shift+D` - Split down  
- `Cmd+Shift+H/J/K/L` - Navigate splits (vim-style)
- `Cmd+K` - Clear screen
- `Cmd+Shift+R` - Reload shell config
- `Cmd+Shift+G` - Quick git status
- `Alt+Left/Right` - Jump by words
- `Cmd+Left/Right` - Jump to line start/end

### **Built-in Functions**

```bash
mkcd dirname           # Create directory and cd into it
extract file.zip       # Extract any archive format
reload                 # Reload shell configuration
lsg                    # List files with git status
```

## **Configuration Structure**

```text
~/.zsh/
├── aliases.zsh        # Modern command aliases
├── functions.zsh      # Custom shell functions
├── keybinds.zsh      # Terminal key bindings
└── nvm.zsh           # Node version management

~/.config/
├── ghostty/config    # Terminal configuration
└── starship.toml     # Prompt configuration
```

## **Security & Git Setup**

This setup integrates with 1Password for secure credential management:

1. **Setup 1Password** and enable SSH agent
2. **Create `~/.gitconfig.local`** with your details:

```bash
[user]
    name = Your Name
    email = your.email@example.com
    signingkey = your-1password-ssh-key
```

## **Customization**

All configurations are managed by [chezmoi](https://www.chezmoi.io/), making them:

- **Version controlled** - Track changes and roll back if needed
- **Templated** - Different configs for different machines
- **Secure** - Encrypted secrets support
- **Reproducible** - Same setup on any new machine

To customize:

```bash
# Edit any config file
chezmoi edit ~/.zshrc

# Apply changes
chezmoi apply

# Add new files to version control
chezmoi add ~/.newconfig
```
