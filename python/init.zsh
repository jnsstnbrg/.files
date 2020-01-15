if (( $+commands[pyenv] )); then
  eval "$(pyenv init -)"
  if (( $+commands[pyenv-virtualenv-init] )); then
    eval "$(pyenv virtualenv-init -)"
  fi
fi
