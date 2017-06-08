# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/jonasstenberg/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker gitignore man mvn node python sublime zsh-completions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias 100koll="cd ~/Documents/Develop/eon/100koll"
alias ios="cd ~/Documents/Develop/eon/EonAPP/EON-100Koll-iOS"
alias smhi="cd ~/Documents/Develop/eon/smhi"

alias deploy_100koll="~/Documents/Develop/eon/EonTools/deploy/deploy.sh -w /Users/jonasstenberg/Documents/Develop/eon/100koll/Hundrakoll/assembly/assembly.eonapi/target/eonapi.war"
alias deploy_100koll_jenkins="~/Documents/Develop/eon/EonTools/deploy/deploy.sh -w /Users/jonasstenberg/Documents/Develop/eon/100koll/releases/eonapi.war -w /Users/jonasstenberg/Documents/Develop/eon/100koll/releases/eventsystem.war;"
alias deploy_100koll_python="python ~/Documents/Develop/eon/EonTools/deploy/deploy.py -w ~/Documents/Develop/eon/100koll/Hundrakoll/assembly/assembly.eonapi/target/eonapi.war ~/Documents/Develop/eon/100koll/Hundrakoll/assembly/assembly.eventsystem/target/eventsystem.war"

alias haproxy_enable="python ~/Documents/Develop/eon/EonTools/scripts/haproxy.py --enable --host"
alias haproxy_disable="python ~/Documents/Develop/eon/EonTools/scripts/haproxy.py --disable --host"
alias eontools="cd ~/Documents/Develop/eon/EonTools"
alias eonfoundation="cd ~/Documents/Develop/eon/EonFoundation"
alias cb="cd ~/Documents/Develop/crossbreed/Source/Release1"
alias ll="ls -l"


source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="/usr/local/sbin:$PATH"

onlinepaste(){
  curl -F 'sprunge=<-' http://sprunge.us
}

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
        echo "This file is created by Viktors zshrc update procedure. Its used to make zsh only update the rc every X minutes. If you remove this file it will be created the next time you open a shell" > ~/.lastcheck
      fi
  fi
  URL=https://bitbucket.org/jnsstnbrg/.files/raw/f3fcccbc434032fcb39aae790d420ce9aefd58cc
  #First fetch the new zshrc
  echo "Updating to latest zshrc..."
  #Run the repo update
  downloadFile ~/.zshrc                $URL/.zshrc
  echo "Using the new zshrc to update the other configs"
  source ~/.zshrc true
  internalUpdate
};
# Used to be able to use both curl and wget
downloadFile(){
  OUTPUTFILE=$1
  TMPFILE="/tmp/downloadFile"
  URL_TO_FILE=$2
  if [[ "$(uname)" == "Darwin" ]]; then
    # If mac try to use wget, since curl and ssl + sni is fucked up
    if hash wget 2> /dev/null; then
      wget --quiet --no-check-certificate -O ${OUTPUTFILE} ${URL_TO_FILE}
      if "$?" = 0; then
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
      if [ "$?" -eq 0 ]; then
        mv -f ${TMPFILE} ${OUTPUTFILE}
      else
        return 1
      fi
    elif hash wget 2> /dev/null; then
      wget --quiet --no-check-certificate -O ${TMPFILE} ${URL_TO_FILE}
      if [ "$?" -eq 0 ]; then
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
  if [ ! $(echo $added_keys | grep -o -e "$HOME/.ssh/id_rsa_deploy") ]; then
      if [[ -e ~/.ssh/id_rsa_deploy ]]; then
        echo "dduser SSH Key:"
        ssh-add ~/.ssh/id_rsa_deploy
      fi
  fi
  if [ ! $(echo $added_keys | grep -o -e "$HOME/.ssh/id_rsa_work") ]; then
      if [[ -e ~/.ssh/id_rsa_work ]]; then
        echo "dduser SSH Key:"
        ssh-add ~/.ssh/id_rsa_work
      fi
  fi
}
internalUpdate(){
  URL=https://bitbucket.org/jnsstnbrg/.files/raw/f3fcccbc434032fcb39aae790d420ce9aefd58cc
  if [[ ! -d ~/.oh-my-zsh ]]; then
    echo "Oh-my-zsh not installed. Installing now."
    wget --quiet --no-check-certificate http://install.ohmyz.sh -O - | sh
  fi
  echo "Updating to latest vimrc..."
  downloadFile  ~/.vimrc                 $URL/vimrc
  if [ "$?" -ne 0 ]; then
    echo "Failed to download vimrc config"
    return 1
  fi
  echo "Updating to latest sshconfig..."
  mkdir ~/.ssh  2>/dev/null
  downloadFile  ~/.ssh/config            $URL/sshconfig
  chmod 400 ~/.ssh/config
  if [ "$?" -ne 0 ]; then
    echo "Failed to download sshconfig config"
    return 1
  fi
  downloadFile  ~/.ssh/sshkey            $URL/sshkey
  chmod 400 ~/.ssh/sshkey
  if [ "$?" -ne 0 ]; then
    echo "Failed to download sshconfig config"
    return 1
  fi
  addKeys
  echo "Latest configs installed"
};
# This must be last in the script
if [ "$1" != "true" ]; then
    dotupdate true
fi