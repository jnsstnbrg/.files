import shutil
import os
from subprocess import call

home = os.path.expanduser("~")
dotfiles = '.dotfiles'

# brewfile
# call(['brew', 'bundle', '--file={}/{}/brew/.brewfile'.format(home, dotfiles)])

# ackrc
call(['ln', '-s', '{}/{}/ackrc/.ackrc'.format(home, dotfiles), '{}/.ackrc'.format(home)])

# git
call(['ln', '-s', '{}/{}/git/.gitconfig'.format(home, dotfiles), '{}/.gitconfig'.format(home)])

# zshrc
call(['ln', '-s', '{}/{}/zsh/.zshrc'.format(home, dotfiles), '{}/.zshrc'.format(home)])
call(['ln', '-s', '{}/{}/zsh/.aliases.zsh'.format(home, dotfiles), '{}/.aliases.zsh'.format(home)])
call(['ln', '-s', '{}/{}/zsh/.scripts.zsh'.format(home, dotfiles), '{}/.scripts.zsh'.format(home)])

# nvim
call(['ln', '-s', 'nvim.config', '{}/.config/nvim/init.vim'.format(home)])
call(['nvim', '+PlugInstall', '+qall'])
