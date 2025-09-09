#!/bin/bash

set -euo pipefail

# init/setup required submodules (exclude oh-my-zsh). Only if present.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if git -C "$SCRIPT_DIR" submodule status -- ".vim/bundle/vundle" >/dev/null 2>&1; then
  git -C "$SCRIPT_DIR" submodule update --init --recursive -- ".vim/bundle/vundle" || true
fi

# Copy all repository files into $HOME, backing up anything overwritten
BACKUP_DIR="$HOME/dotfiles-backup-$(date +%Y%m%d%H%M%S)"
mkdir -p "$BACKUP_DIR"

echo "Copying files from $SCRIPT_DIR to $HOME"
rsync -aH \
  --no-perms --no-owner --no-group \
  --backup --backup-dir="$BACKUP_DIR" \
  --exclude ".git/" \
  --exclude ".gitmodules" \
  --exclude "install.sh" \
  --exclude "README.md" \
  --exclude ".DS_Store" \
  --exclude ".oh-my-zsh/" \
  "$SCRIPT_DIR"/ "$HOME"/

echo "Backup of overwritten files (if any) saved to: $BACKUP_DIR"
echo "Done."

# Don't forget to set zsh as shell. Restart
# chsh -s /bin/zsh
