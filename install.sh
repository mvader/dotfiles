#!/bin/sh

echo 'Linking files...'
wd=$(pwd)
rm -rf ~/.config/nvim
unlink ~/.vim > /dev/null
unlink ~/.vimrc > /dev/null
unlink ~/.tmux.conf > /dev/null
ln -s "$wd/.vim" ~/.vim
ln -s "$wd/.vimrc" ~/.vimrc
ln -s "$wd/.tmux.conf" ~/.tmux.conf
mkdir -p ~/.config/nvim
ln -s "$wd/.vimrc" ~/.config/nvim/init.vim
echo 'Linked files'

echo 'Installing neobundle...'
curl -S https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > ~/neobundle_install.sh
sh ~/neobundle_install.sh > /dev/null
rm ~/neobundle_install.sh > /dev/null
echo 'Neobundle installed...'

# TODO detect if go is installed

echo 'Installing plugins...'
pip install --upgrade --user neovim > /dev/null
go get -u github.com/nsf/gocode > /dev/null
echo 'Plugins installed'

echo "All setup! Do not forget to run :UpdateRemotePlugins in neovim"
