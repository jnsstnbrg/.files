#!/bin/bash

if [[ ! -d "~/.tmux/plugins/tpm" ]]; then
  mkdir -p  ~/.tmux/plugins/tpm
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
