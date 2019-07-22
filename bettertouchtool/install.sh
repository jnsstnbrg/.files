#!/bin/bash

mkdir -p ~/Library/Application\ Support/BetterTouchTool
rm -f ~/Library/Application\ Support/BetterTouchTool/bttdata2

ln -s $DOTFILES/bettertouchtool/bttdata2.json ~/Library/Application\ Support/BetterTouchTool/bttdata2
