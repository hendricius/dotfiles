# Personal dotfiles

My personal dotfiles I use between my systems. Perfect for sharing the same
editor/config on your servers/local machine. Contains my preferred ruby vim
plugins.

# Setup

Option 1: Copy paste the respective folders to your home folder.

Option 2: Use the install.sh script to get started fast. This will backup your
existing dotfiles and use mine instead.

    # Make sure to have the following installed:
    apt-get install git vim zsh ack-grep tmux curl
    cd && git clone git://github.com/hendricius/dotfiles.git
    cd ~/dotfiles/
    git submodule init && git submodule update
    ./install.sh
    cd
    touch .app_config_vars
    chsh -s /bin/zsh
