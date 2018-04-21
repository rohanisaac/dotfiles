#!/usr/bin/env python
"""
Symbolically link all the files in the following list to the home directory
"""
import os

home_dir = os.path.expanduser('~')
current_dir = os.path.curdir()

files_to_link = ['.bashrc',
                 '.bash_aliases',
                 '.inputrc',
                 '.git-prompt.sh',
                 '.vimrc',
                 '.tmux.conf']

for f in files_to_link:
    os.symlink(os.path.join(current_dir, f), os.path.join(home_dir, f))

