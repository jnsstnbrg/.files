#!/bin/bash

install_pyenv() {
  if [ "$(pyenv versions | grep -Eio "2.7.16")" == "" ]; then
    echo "Installing 2.7.16"
    pyenv install 2.7.16
    pyenv virtualenv 2.7.16 neovim2
  fi
  if [ "$(pyenv versions | grep -Eio "3.8.0")" == "" ]; then
    echo "Installing 3.8.0"
    pyenv install 3.8.0
    pyenv virtualenv 3.8.0 neovim3
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
