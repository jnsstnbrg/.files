if [ ! -f ~/.config/kitty/snazzy.conf ]; then
  ln -s "${DOTFILES}/kitty/snazzy.conf" ~/.config/kitty/snazzy.conf
fi

if [ ! -f ~/.config/kitty/kitty.conf ]; then
  ln -s "${DOTFILES}/kitty/kitty.conf" ~/.config/kitty/kitty.conf
fi
