#!/bin/bash
# Prerequesities
# apt-get install git vim zsh tmux curl
# chsh -s /bin/zsh


# setup
cd
git clone git://github.com/hendricius/dotfiles.git
REPO=dotfiles/
BASE_PATH=$(pwd)
REPO_PATH=$BASE_PATH/$REPO
BKP_DIR=backup-config
cd ~/
mkdir $BKP_DIR

# replace existing files #

for f in $REPO_PATH
do
  echo "taking care of $f ..."
  if [ -e "$f" ]; then
    echo "$f already exists, backing up..."
    mv $f $BKP_DIR
  fi
  echo "creating symlink for $f"
  ln -sf $REPO_PATH/$f $f
done
