# Vim
alias vim="nvim"

# Node
alias nodenv_set="sh ~/Develop/Work/Jayway/nodenv/nodenv.sh"

# IP addresses
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume output volume 100'"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'
