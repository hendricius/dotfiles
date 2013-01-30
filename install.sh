#!/bin/bash
apt-get install git vim zsh tmux curl
cd ~/
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh
| sh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
chsh -s /bin/zsh
git clone git://github.com/hendricius/dotfiles.git

# replace existing files #
cd ~/
mkdir backup-config
mv .vim* backup-config/
mv .gitconfig backup-config/
mv .tmux.conf backup-config/
mv .zsh* backup-config/
cd dotfiles
cp -R .vim ../
cp .git* ../
cp .tmux* ../
cp .vimrc ../
cp .zsh* ../
