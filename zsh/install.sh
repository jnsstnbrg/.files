#!/bin/bash

DIRECTORY=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
if [[ ! -d "$DIRECTORY" ]]; then
  echo "Cloning zsh-syntax-highlighting"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $DIRECTORY
fi
