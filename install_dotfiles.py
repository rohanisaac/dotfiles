#!/usr/bin/env python

import os

home_dir = os.path.expanduser('~')
current_dir = os.path.curdir()

files_to_link = ['.bashrc', '.vimrc', '.tmux.conf', '.Xresources', '.vimrc_python']

for f in files_to_link:
    os.symlink(os.path.join(current_dir, f), os.path.join(home_dir, f))


