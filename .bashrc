# ~/.bashrc CONFIGURATION FILE

# Set bash options
# ----------------------------------------------------------------------------
shopt -s checkwinsize # update window size after each command
shopt -s histappend # append to history file

# Basic enviroment variables
# ----------------------------------------------------------------------------
export EDITOR=vim
export PROMPT_DIRTRIM=2
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# large bash history
export HISTSIZE=100000
export HISTFILESIZE=100000

# color to terminal
export CLICOLOR=1

# PATH and other includes
# ----------------------------------------------------------------------------
FULLPROF=$HOME/bin/FullProf_Suite
ORCA=$HOME/bin/orca
PGI=/opt/pgi/linux86-64/18.10/bin
MPI=/usr/lib64/openmpi/bin # for mpiexec, mpirun and lmp on linux
LOCALBIN=$HOME/.local/bin:$HOME/bin
SYNCSCRIPTS=$HOME/Cloud/scripts/linux
PATH=$LOCALBIN:$SYNCSCRIPTS:$PATH:$FULLPROF:$PGI:$ORCA:$MPI

PYTHONPATH="$PYTHONPATH:$HOME/Cloud/python/spectra"
PYTHONPATH="$PYTHONPATH:$HOME/Cloud/python/spc"

# export to make them available to subprocesss
export PYTHONPATH
export FULLPROF
export MANPATH
export PATH

# bash completion
if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
fi

# add fzf
# [ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f /usr/share/fzf/shell/key-bindings.bash ] && source /usr/share/fzf/shell/key-bindings.bash

# PS1
# ----------------------------------------------------------------------------
red='\[\033[0;31m\]'
green='\[\033[0;32m\]'
yellow='\[\033[0;33m\]'
purple='\[\033[0;35m\]'
white='\[\033[0;37m\]'
blue='\[\033[0;34m\]'
cyan='\[\033[0;36m\]'
NC='\[\033[0m\]'

if [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
    export PS1="$yellow\u$NC@$yellow\H $purple\w $cyan\$( __git_ps1 '(%s)' )$NC\n$ "
else
    export PS1="$yellow\u$NC@$yellow\H $purple\w $NC\n$ "
fi

# Source other files
# ----------------------------------------------------------------------------

# source bash aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# source bash aliases
if [ -f ~/.private_aliases ]; then
    . ~/.private_aliases
fi

# nvm for nodejs and npm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
