```
________          __    _____.__.__                 
\______ \   _____/  |__/ ____\__|  |   ____   ______
 |    |  \ /  _ \   __\   __\|  |  | _/ __ \ /  ___/
 |    `   (  <_> )  |  |  |  |  |  |_\  ___/ \___ \ 
/_______  /\____/|__|  |__|  |__|____/\___  >____  >
        \/                                \/     \/ 
```

# Personal dotfiles

Opinionated dotfiles to keep my shell/editor setup consistent across machines.

## Dependencies

Make sure you have these available (install as needed):

- pynev
- rbenv
- nvm
- oh-my-zsh

oh-my-zsh must be installed prior to running the installer; this repo does not install it.

## Quick start

If you already have the repo locally:

    make install

Or clone then install:

    cd ~
    git clone <REPO_URL> dotfiles
    cd ~/dotfiles
    make install

## What the installer does

- Copies all files from this repo into your home directory
- Backs up any overwritten files to `~/dotfiles-backup-<timestamp>`
- Skips version-control and helper files

## After install (optional)

- Switch your login shell to zsh, if not already:

      chsh -s /bin/zsh
      exec $SHELL

- Install Vim plugins:

      # open Vim, then run
      :PluginInstall

## Updating

Pull the latest changes and run the installer again:

    git pull
    make install

## Restoring from backup

The installer saves overwritten files in `~/dotfiles-backup-<timestamp>`. To restore the most recent backup:

    LATEST_BACKUP=$(ls -dt ~/dotfiles-backup-* | head -1)
    rsync -aH "$LATEST_BACKUP"/ "$HOME"/
