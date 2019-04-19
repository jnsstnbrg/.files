#!/bin/bash

install_pyenv() {
  if [ "$(pyenv versions | grep -Eio "2.7.11")" == "" ]; then
    echo "Installing 2.7.11"
    pyenv install 2.7.11
    pyenv virtualenv 2.7.11 neovim2
  fi
  if [ "$(pyenv versions | grep -Eio "3.7.0")" == "" ]; then
    echo "Installing 3.7.0"
    pyenv install 3.7.0
    pyenv virtualenv 3.7.0 neovim3
  fi

  pyenv activate neovim2
  if hash pynvim 2>/dev/null; then
    echo "Installing pynvim in pyenv `neovim2`"
    pip install pynvim
  fi

  pyenv activate neovim3
  if hash pynvim 2>/dev/null; then
    echo "Installing pynvim in pyenv `neovim3`"
    pip install pynvim
  fi
}

eval "$(pyenv init -)"
install_pyenv
