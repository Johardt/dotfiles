# Johardt's dotfiles

A minimal and organized collection of configuration files to set up a productive MacOS development environment.
Deliberately simple, focusing on essential tools and configurations; meant to be extendable.
Made to feel unobtrusive, respecting your preferences and workflow.

## Setup

1. **Install Homebrew**: Follow the instructions to install [Homebrew](https://brew.sh/) on your system.

2. **Install Chezmoi**: Use Homebrew to install [Chezmoi](https://www.chezmoi.io/):

   ```bash
   brew install chezmoi
   ```

3. **Apply configuration**: Execute the following commands to initialize and apply the configuration:

   ```bash
   chezmoi init git@github.com:Johardt/dotfiles.git
   chezmoi apply
   ```

4. **Install dependencies**: After applying the configuration, run the following command to install necessary packages:

    ```bash
    brew bundle install --file=~/.Brewfile
    ```

And that's it! Although you will want to follow the instructions for the post-installation to integrate 1Password with git and SSH.

## Post-Installation

### Setting up 1Password for Git and SSH

The `.gitconfig` file has been set up to use the `1password` credential helper. You will need to follow the [instructions provided by 1Password](https://developer.1password.com/docs/ssh/get-started) to complete the integration with ssh.
You should now have a .ssh/config file that looks like this:

```ini
Host *
  IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
```

The .gitconfig expects a `.gitconfig.local` file to be present.
In this file, you need to add your default git email and name, as well as your default SSH public key, under the `[user]` section, like this:

```ini
[user]
  email = <your_email@example.com>
  name = Your Name
  sshKey = <your_ssh_public_key>
```

Of course you can also add any further git profile orchestration you want to have in this file, like setting up a configuration for work and personal repositories:

```ini
[includeIf "gitdir:~/Projects/work/"]
  path = ~/Projects/work/.gitconfig
```

Finally, you need to set up GitHub / GitLab SSH keys for authentication and signing commits.
You can follow the instructions in the [GitHub documentation](https://docs.github.com/authentication/connecting-to-github-with-ssh).

### Next Steps

- **Configure Raycast**: Setup shortcuts to quickly open Browser, Terminal, and IDE.
- **Add Browser extensions**: Install extensions like 1Password and uBlock Origin.
