if [ ! -L ~/.config/kitty/snazzy.conf ]; then
  mkdir -p ~/.config/kitty
  ln -s ~/.dotfiles/kitty/snazzy.conf ~/.config/kitty/snazzy.conf
fi

if [ ! -L ~/.config/kitty/kitty.conf ]; then
  mkdir -p ~/.config/kitty
  ln -s ~/.dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf
fi
