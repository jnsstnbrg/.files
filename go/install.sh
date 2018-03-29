#!/bin/bash

mkdir -p $HOME/Develop/Go
mkdir -p $HOME/Develop/Go/src/github.com/user

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

DIRECTORY="~/.vim/plugged/vim-go"
if [ ! -d "$DIRECTORY" ]; then
  git clone https://github.com/fatih/vim-go.git $DIRECTORY
fi
