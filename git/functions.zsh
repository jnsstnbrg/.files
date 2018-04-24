function glol() {
  git log --graph --pretty='%h%Creset - %C(cyan)%ad%Creset -%C(cyan)%d%Creset %s %C(cyan)<%an>%Creset' --date=format:'%Y-%m-%d %H:%M:%S' --abbrev-commit -${1:-30} HEAD
}
