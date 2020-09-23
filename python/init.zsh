# if (( $+commands[pyenv] )); then
#   eval "$(pyenv init -)"
#   if (( $+commands[pyenv-virtualenv-init] )); then
#     eval "$(pyenv virtualenv-init -)"
#   fi
# fi
#
# if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
#   source "${VIRTUAL_ENV}/bin/activate"
# fi
#
# if (( $+commands[pipenv] )); then
#   eval "$(pipenv --completion)"
# fi
