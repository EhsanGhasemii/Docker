#!/bin/bash

# Create a backup of the original hosts file
cp /etc/hosts /etc/hosts.bak

# Append the Github ip address entry to the hosts file
echo "185.199.108.133 raw.githubusercontent.com" >> /etc/hosts

# Download nvim configuration and plugins{NERD_tree and indentLine}
mkdir -p ~/.config/nvim/
wget https://raw.githubusercontent.com/EhsanGhasemii/Linux_tutorial/refs/heads/main/vim/init.vim -O ~/.config/nvim/init.vim
wget https://raw.githubusercontent.com/EhsanGhasemii/Linux_tutorial/refs/heads/main/zsh/zshrc -O ~/.zshrc
wget https://raw.githubusercontent.com/EhsanGhasemii/Git_tutorial/refs/heads/main/gitconfig -O ~/.gitconfig
mkdir -p ~/.local/share/nvim/site/pack/plugins/start/
wget https://www.vim.org/scripts/download_script.php?src_id=23731 -O ~/.local/share/nvim/site/pack/plugins/start/NERD_tree.zip
unzip ~/.local/share/nvim/site/pack/plugins/start/NERD_tree.zip -d ~/.local/share/nvim/site/pack/plugins/start/NERD_tree
wget https://www.vim.org/scripts/download_script.php?src_id=22741 -O ~/.local/share/nvim/site/pack/plugins/start/indentLine.zip
unzip ~/.local/share/nvim/site/pack/plugins/start/indentLine.zip -d ~/.local/share/nvim/site/pack/plugins/start/indentLine

# Execute the original command
exec "$@"

