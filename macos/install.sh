#!/bin/bash

# The Brewfile handles Homebrew-based app and library installs, but there may
# still be updates and installables in the Mac App Store. There's a nifty
# command line interface to it that we can use to just install everything, so
# yeah, let's do that.

echo "› sudo softwareupdate -i -a"
sudo softwareupdate -i -a

apps=("Google Chrome" "Mail" "Slack" "iTerm" "System Preferences")

IFS=""
for app in ${apps[*]}; do
  found=$(python $DOTFILES/scripts/dockutil.py --find "$app")
  if [[ $found == *"was not found in"* ]]; then
    echo "Adding $app to Dock"
    python "$DOTFILES/scripts/dockutil.py" --add "/Applications/$app.app"
  else
    echo "$app already exists in Dock"
  fi
done

echo "› add login-script"
sudo defaults write com.apple.loginwindow LoginHook ${DOTFILES}/macos/login_script.sh

echo "› add symlink to iCloud"
ln -s ~/Library/Mobile\ Documents/com\~apple\~CloudDocs ~/iCloud

echo "› add symlink to ~/.ssh from iCloud"
ln -s ~/iCloud/.ssh ~
