#!/bin/bash

nodenv global 8.4.0 && nodenv rehash

if test ! $(which tern); then
  npm install tern -g
fi

if test ! $(which tldr); then
  npm install tldr -g
fi
