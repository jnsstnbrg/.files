#!/bin/bash

# Install oh my zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

DIRECTORY=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
if [[ ! -d "$DIRECTORY" ]]; then
  echo "Cloning zsh-syntax-highlighting"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $DIRECTORY
fi
