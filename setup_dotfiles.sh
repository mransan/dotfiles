#!/bin/bash

mv $HOME/.bashrc $HOME/.bashrc.backup
ln -s $HOME/dotfiles.git/vimrc $HOME/.vimrc
ln -s $HOME/dotfiles.git/bashrc $HOME/.bashrc
ln -s $HOME/dotfiles.git/vim $HOME/.vim
ln -s $HOME/dotfiles.git/gitconfig $HOME/.gitconfig
echo "Done..."
