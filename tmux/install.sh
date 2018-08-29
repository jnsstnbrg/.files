#!/bin/bash

if [[ ! -d ~/.tmux/plugins/tpm ]]; then
  mkdir -p  ~/.tmux/plugins/tpm
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

for filename in ${DOTFILES}/tmux/projects/*; do
  if [[ ! -f ~/.config/tmuxinator/${filename##*/} ]]; then
    ln -s ${filename} ~/.config/tmuxinator
  fi
done
