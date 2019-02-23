#!/bin/bash

# Install oh my zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
fi

if [[ ! -d "${ZSH_CUSTOM1:-$ZSH}/themes/jnsstnbrg" ]]; then
	ln -s "${DOTFILES}/zsh/theme" "${ZDOTDIR:-$HOME}/.zprezto/modules/prompt/functions/prompt_jonas_setup"
fi
