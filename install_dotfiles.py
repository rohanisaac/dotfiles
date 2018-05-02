#!/usr/bin/env python
"""
Symbolically link all the files in the following list to the home directory
"""
import os

home_dir = os.path.expanduser('~')
current_dir = os.path.dirname(os.path.realpath(__file__))

files_to_link = ['.bashrc',
		 '.bash_profile',
                 '.bash_aliases',
                 '.inputrc',
                 '.git-prompt.sh',
                 '.vimrc',
                 '.tmux.conf']

for f in files_to_link:
    os.symlink(os.path.join(current_dir, f), os.path.join(home_dir, f))

<<<<<<< Updated upstream
=======
# Also install fzf
"""
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# and vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"""
>>>>>>> Stashed changes
