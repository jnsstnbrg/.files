# Add specified keys to ssh-agent each login, whether or not configs need to be updated or not.
HOME=~
added_keys=`ssh-add -l`
if [[ ! $(echo $added_keys | grep -o -e "$HOME/.ssh/id_rsa ") ]]; then
  echo "Personal SSH Key:"
  ssh-add ~/.ssh/id_rsa
fi
if [[ ! $(echo $added_keys | grep -o -e "$HOME/.ssh/id_rsa_work") ]]; then
  if [[ -e ~/.ssh/id_rsa_work ]]; then
    echo "dduser SSH Key:"
    ssh-add ~/.ssh/id_rsa_work
  fi
fi
