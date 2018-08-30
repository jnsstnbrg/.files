#!/bin/bash

install_pyenv() {
  if [ "$(pyenv versions | grep -Eio "2.7.11")" == "" ]; then
    echo "Installing 2.7.11"
    pyenv install 2.7.11
    pyenv virtualenv 2.7.11 neovim2
  fi
  if [ "$(pyenv versions | grep -Eio "3.4.4")" == "" ]; then
    echo "Installing 3.4.4"
    pyenv install 3.4.4
    pyenv virtualenv 3.4.4 neovim3
  fi

  pyenv activate neovim2
  if hash neovim 2>/dev/null; then
    echo "Installing neovim in pyenv `neovim2`"
    pip install neovim
  fi

  pyenv activate neovim3
  if hash neovim 2>/dev/null; then
    echo "Installing neovim in pyenv `neovim3`"
    pip install neovim
  fi
}

eval "$(pyenv init -)"
install_pyenv
