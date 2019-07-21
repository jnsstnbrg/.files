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

install_plugins() {
  bullet "Running PlugInstall... "
  nvim +PlugInstall +UpdateRemotePlugins +qall
  success "done"

  extensions="coc-tsserver coc-eslint coc-json coc-html coc-css coc-tag coc-vetur coc-gocode coc-pairs"
  bullet "Installing Coc extensions... "
  mkdir -p ~/.config/coc/extensions
  cd ~/.config/coc/extensions
  npm install -S $extensions
  success "done"
}

install_plugins
ln -s "${DOTFILES}/nvim/coc-settings.json" ~/.config/nvim/coc-settings.json
