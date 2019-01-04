#!/bin/bash

rubies=(
  '2.5.0'
)

# Ruby Installation
install_ruby () {
  if hash rbenv 2>/dev/null; then
    for rb in "${rubies[@]}"; do
      if [ "$(rbenv versions | grep -Eio $rb)" == $rb ]; then
        printf "\e[0;32m       * ruby $rb is already installed...\n\e[0m"
      fi

      if [ "$(rbenv versions | grep -Eio $rb)" == "" ]; then
        rbenv install $rb
      fi
    done

    rbenv global "${rubies}"
    sleep 1
    gem install bundler
  fi
}

if [ "$(gem list --local | grep -Eio "neovim")" == "" ]; then
  echo "Installing neovim"
  gem install neovim
fi

install_ruby
