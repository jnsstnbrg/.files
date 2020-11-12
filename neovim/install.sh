#!/bin/bash

pip3 install neovim

mkdir -p ~/.config/nvim/

cat > ~/.config/nvim/init.vim << EOF
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
EOF

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# nvim +PlugInstall +qall
# nvim +GoInstallBinaries +qall

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

install_plugins() {
  echo "Running PlugInstall... "
  nvim +PlugInstall +UpdateRemotePlugins +qall
  success "done"

  extensions="coc-tsserver coc-eslint coc-json coc-html coc-css coc-tag coc-vetur coc-gocode coc-pairs coc-prettier"
  echo "Installing Coc extensions... "
  mkdir -p ~/.config/coc/extensions
  cd ~/.config/coc/extensions
  npm install -S $extensions
  success "done"
}

install_plugins

if [[ ! -L ~/.config/nvim/coc-settings.json ]]; then
  ln -s "${DOTFILES}/neovim/coc-settings.json" ~/.config/nvim/coc-settings.json
fi

if [[ ! -L ~/.config/nvim/lua/fzf.lua ]]; then
  mkdir -p ~/.config/nvim/lua
  ln -s "${DOTFILES}/neovim/fzf.lua" ~/.config/nvim/lua/fzf.lua
fi
