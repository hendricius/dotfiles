#!/bin/bash
# Prerequesities
# apt-get install git vim zsh tmux curl
# git clone git://github.com/hendricius/dotfiles.git

# setting vars
cd
REPO=dotfiles
BASE_PATH=$(pwd)
REPO_PATH=$BASE_PATH/$REPO
FILES=( .gitconfig .gitignore_global .tmux.conf .vim .vimrc .zsh_aliases .zsh_autocomp .zshrc )
BKP_DIR=dotfiles-backup

# Create a backup dir.
mkdir $BKP_DIR

# Install oh-my-zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

# replace existing files #
for f in "${FILES[@]}"
do
  echo "taking care of $f ..."
  if [ -e "$f" ]; then
    echo "$f already exists, backing up..."
    mv $f $BKP_DIR
  fi
  echo "creating symlink for $f"
  ln -sf $REPO_PATH/$f $f
done

# Set empty app config var dir.
touch .app_config_vars

# Don't forget to set zsh as shell. Restart
# chsh -s /bin/zsh
