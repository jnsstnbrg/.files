#!/bin/sh

get_public_ip_cmd=$(curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//')

case "$OSTYPE" in
  *darwin*)
    echo $get_public_ip_cmd | pbcopy
    echo "$get_public_ip_cmd copied to paste board!"
    ;;

  *linux*)
    echo $get_public_ip_cmd
    ;;
esac
