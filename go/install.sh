#!/bin/bash

mkdir -p $HOME/Develop/Go
mkdir -p $HOME/Develop/Go/src/github.com/user

./$GOPATH/src/github.com/nsf/gocode/nvim/symlink.sh

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone https://github.com/fatih/vim-go.git ~/.vim/plugged/vim-go
