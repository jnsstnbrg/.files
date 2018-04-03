#!/bin/bash

nodes=('8.9.4')

# Node.js Installation
install_node () {
  if hash nodenv 2>/dev/null; then
    for node in "${nodes[@]}"; do
      if [ "$(nodenv versions | grep -Eio $node)" == $node ]; then
        printf "\e[0;32m       * node.js v$node is already installed...\n\e[0m"
      fi

      if [ "$(nodenv versions | grep -Eio $node)" == "" ]; then
        nodenv install "$node"
        nodenv global "$node"
        nodenv rehash
      fi
    done
  fi
}

install_node

if test ! $(which tern); then
  npm install tern -g
fi

if test ! $(which tldr); then
  npm install tldr -g
fi

if test ! $(which sam); then
  npm install aws-sam-local -g
fi
