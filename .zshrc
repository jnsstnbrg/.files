export ZSH=/Users/jonasstenberg/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git git-extras docker gitignore man mvn node python sublime zsh-completions brew common-aliases encode64 osx pip sudo zsh-syntax-highlighting alias-tips zsh-vscode tmux)

source $ZSH/oh-my-zsh.sh

alias vi="nvim"
source ~/.config/aliases/jw.sh
source ~/.config/aliases/private.sh

export EDITOR='nvim'

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

export PATH="/usr/local/sbin:$PATH"

#Download new config files
dotupdate(){
  if [ "$1" = "true" ]; then
      if [ -e ~/.lastcheck ]; then
        if test `find ~/.lastcheck -mmin +2040`; then
            echo "Last check was more than the threshold"
            touch ~/.lastcheck
        else
            echo "Dotfiles all up-to-date!"
            return
        fi
      else
        echo "This file is created by Jonas zshrc update procedure. Its used to make zsh only update the rc every X minutes. If you remove this file it will be created the next time you open a shell" > ~/.lastcheck
      fi
  fi
  URL=https://raw.githubusercontent.com/jnsstnbrg/dotfiles/master
  #First fetch the new zshrc
  echo "Updating to latest zshrc..."
  #Run the repo update
  downloadFile ~/.zshrc                $URL/.zshrc
  echo "Using the new zshrc to update the other configs"
  source ~/.zshrc true
  internalUpdate
}

# Used to be able to use both curl and wget
downloadFile(){
  OUTPUTFILE=$1
  TMPFILE="/tmp/downloadFile"
  URL_TO_FILE=$2
  if [[ "$(uname)" == "Darwin" ]]; then
    # If mac try to use wget, since curl and ssl + sni is fucked up
    if hash wget 2> /dev/null; then
      wget --quiet --no-check-certificate -O ${TMPFILE} ${URL_TO_FILE}
      if [ "$?" -eq "0" ]; then
        mv -f ${TMPFILE} ${OUTPUTFILE}
      else
        return 1
      fi
    else
      echo "You're running mac without wget installed, curl wont work with SNI, so install wget plz."
    fi
  else
    if hash curl 2> /dev/null; then
      curl -k --silent -o ${TMPFILE} ${URL_TO_FILE}
      if [ "$?" -eq "0" ]; then
        mv -f ${TMPFILE} ${OUTPUTFILE}
      else
        return 1
      fi
    elif hash wget 2> /dev/null; then
      wget --quiet --no-check-certificate -O ${TMPFILE} ${URL_TO_FILE}
      if [ "$?" -eq "0" ]; then
        mv -f ${TMPFILE} ${OUTPUTFILE}
      else
        return 1
      fi
    else
      echo "You don't have either curl or wget installed, install one of them and try again."
    fi
  fi
  return 0
}

# Add specified keys to ssh-agent each login, whether or not configs need to be updated or not.
addKeys(){
  HOME=~
  added_keys=`ssh-add -l`
  if [ ! $(echo $added_keys | grep -o -e "$HOME/.ssh/id_rsa ") ]; then
     echo "Personal SSH Key:"
     ssh-add ~/.ssh/id_rsa
  fi
  if [ ! $(echo $added_keys | grep -o -e "$HOME/.ssh/id_rsa_work") ]; then
      if [[ -e ~/.ssh/id_rsa_work ]]; then
        echo "dduser SSH Key:"
        ssh-add ~/.ssh/id_rsa_work
      fi
  fi
}

internalUpdate(){
  URL=https://raw.githubusercontent.com/jnsstnbrg/dotfiles/master
  if [[ ! -d ~/.oh-my-zsh ]]; then
    echo "Oh-my-zsh not installed. Installing now."
    wget --quiet --no-check-certificate http://install.ohmyz.sh -O - | sh
  fi
  echo "Updating to latest sshconfig..."
  mkdir ~/.ssh  2>/dev/null
  downloadFile  ~/.ssh/config            $URL/sshconfig
  chmod 600 ~/.ssh/config
  if [ "$?" -ne 0 ]; then
    echo "Failed to download sshconfig config"
    return 1
  fi

  echo "Downloading Brewfile"
  if [[ ! -d ~/.brewfile ]]; then
  	touch ~/.brewfile
  fi
  downloadFile ~/.brewfile $URL/.brewfile

  echo "Downloading nvim config"
  if [[ ! -d ~/.config/nvim/ ]]; then
    mkdir -p ~/.config/nvim/
    if [[ ! -d ~/.config/nvim/init.vim ]]; then
      touch ~/.config/nvim/init.vim
    fi
  fi
  downloadFile ~/.config/nvim/init.vim $URL/nvim.config

  echo "Downloading ackrc config"
  if [[ ! -d ~/.ackrc ]]; then
    touch ~/.ackrc
  fi
  downloadFile ~/.ackrc $URL/.ackrc

  addKeys
  echo "Latest configs installed"
};
# This must be last in the script
if [ "$1" != "true" ]; then
    dotupdate true
fi

if (( $+commands[nodenv] )); then
  eval "$(nodenv init -)"
fi
