#!/bin/bash

mv $HOME/.bashrc $HOME/.bashrc.backup
ln -s $HOME/dotfiles.git/vimrc $HOME/.vimrc
ln -s $HOME/dotfiles.git/bashrc $HOME/.bashrc
ln -s $HOME/dotfiles.git/gitconfig $HOME/.gitconfig
ln -s $HOME/dotfiles.git/inputrc $HOME/.inputrc

mkdir -p $HOME/.vim
mkdir -p $HOME/.vim/autoload
mkdir -p $HOME/.vim/plugin

ln -s $HOME/dotfiles.git/vim/autoload/fuf $HOME/.vim/autoload/fuf
ln -s $HOME/dotfiles.git/vim/autoload/fuf.vim $HOME/.vim/autoload/fuf.vim 
ln -s $HOME/dotfiles.git/vim/plugin/fuf.vim $HOME/.vim/plugin/fuf.vim
ln -s $HOME/dotfiles.git/vim/autoload/l9 $HOME/.vim/autoload/l9
ln -s $HOME/dotfiles.git/vim/autoload/l9.vim $HOME/.vim/autoload/l9.vim 
ln -s $HOME/dotfiles.git/vim/plugin/l9.vim $HOME/.vim/plugin/l9.vim

echo "Done..."
