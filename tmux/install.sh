#!/bin/bash

if [[ ! -d ~/.tmux/plugins/tpm ]]; then
  mkdir -p  ~/.tmux/plugins/tpm
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

if [ "$(gem list --local | grep -Eio "tmuxinator")" == "" ]; then
  eval "$(rbenv init -)"
  gem install --user tmuxinator
fi

for filename in ${DOTFILES}/tmux/projects/*; do
  mkdir -p ~/.config/tmuxinator
  if [[ ! -f ~/.config/tmuxinator/${filename##*/} ]]; then
    ln -s ${filename} ~/.config/tmuxinator/${filename##*/}
  fi
done
