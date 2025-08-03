# Johardt's dotfiles

I like pretty things. I also like to stick to best practices and standards.
Reflecting this, I have created a set of dotfiles that are simple, clean, and effective.
It uses [chezmoi](https://www.chezmoi.io/) primarily for managing and versioning my configuration files.
These dotfiles configure a MacOS environment with a focus on developer productivity, with one command.

## Features

- Deliberately simple, focusing on essential tools and configurations; meant to be extendable.
- Made to feel unobtrusive, respecting your preferences and workflow (Like adapting to system themes).
- Declarative and idempotent, ensuring a reliable setup every time you run it.
- Integrates with 1Password for secure credential management.

## Installation

Execute the following commands to initialize and apply the configuration:

  ```bash
  sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply Johardt
  ```

And that's it! Although you will want to follow the instructions for the post-installation to integrate 1Password with git and SSH.

## Post-Installation

These are all optional steps you can follow for a deeper integration of the dotfiles with your system and tools.
None of these are required, but are my preferred configurations.

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

### Configure Raycast

Open Raycast and go to Settings > Advanced.
Select "Import" and choose `default.rayconfig` from the `~/.config` directory.
This will import the default configuration for Raycast, which includes various extensions and settings that enhance your productivity.
