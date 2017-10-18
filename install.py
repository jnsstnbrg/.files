import shutil
import os, errno
from subprocess import call

home = os.path.expanduser("~")

def mkdir(dir):
    try:
        os.makedirs(dir)
    except OSError as e:
        if e.errno != errno.EEXIST:
            raise

def copyTree(src, dst):
    try:
        #if path already exists, remove it before copying with copytree()
        if os.path.exists(dst):
            shutil.rmtree(dst)
            shutil.copytree(src, dst)
    except OSError as e:
        # If the error was caused because the source wasn't a directory
        if e.errno == errno.ENOTDIR:
            shutil.copy(source_dir_prompt, destination_dir_prompt)
        else:
            print('Directory not copied. Error: %s' % e)

# Copy all dotfiles
shutil.copy('.brewfile', home)
shutil.copy('.zshrc', home)
shutil.copy('.ackrc', home)
shutil.copy('.gitconfig', home)
copyTree('aliases', '{}/.config/aliases'.format(home))
copyTree('scripts', '{}/.config/scripts'.format(home))

mkdir('{}/.ssh'.format(home))
shutil.copy('sshconfig', '{}/.ssh/config'.format(home))

nvimDir = '{}/.config/nvim'.format(home)
mkdir('{}/.config/nvim'.format(home))
shutil.copy('nvim.config', '{}/init.vim'.format(nvimDir))

# Install brews
call(['brew', 'bundle', '--file={}/.brewfile'.format(home)])

# Install nvim plugins
call(['nvim', '+PlugInstall', '+qall'])
