# Johardt-Dotfiles

A powerful, modern macOS development environment with supercharged terminal experience.

## What You Get

### **Enhanced Terminal Experience**

- **Smart directory navigation** with [zoxide](https://github.com/ajeetdsouza/zoxide) - `cd` on steroids
- **Fuzzy finding everything** with [fzf](https://github.com/junegunn/fzf) - files, history, directories
- **Syntax highlighting** for commands as you type (green = valid, red = invalid)
- **Intelligent autosuggestions** based on your history and completions
- **Modern replacements** for classic commands:
  - `ls` → `eza` (beautiful file listings with icons and git status)
  - `cat` → `bat` (syntax highlighting and paging)
  - `grep` → `ripgrep` (blazingly fast search)
  - `find` → `fd` (intuitive file finding)

### **Productivity Features**

- **History management** (5000 entries, no duplicates, secrets filtered out)
- **Smart completion** (case-insensitive, grouped, with descriptions)
- **Vim-style navigation** in completion menus
- **Custom functions** for common tasks (extract archives, kill processes, etc.)
- **Git integration** with fzf for interactive staging and log browsing

### **Terminal & UI**

- **Ghostty terminal** with optimized keybinds and clean aesthetics
- **Starship prompt** for beautiful, informative command line
- **JetBrains Mono Nerd Font** with icons and ligatures
- **Smart window management** with splits and tabs

### **Package Management**

- **Enhanced Homebrew** workflow with `brew add`/`brew remove`
- **Declarative package management** via synchronized Brewfile
- **Automatic chezmoi integration** for reproducible setups

### **Production-ready environment**

- **Includes Zen Browser, VSCode, Ghostty** to immediately set you up to develop
- **Includes Slack, Zoom, 1Password** for communication and collaboration

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

[commit]
    gpgsign = true
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
