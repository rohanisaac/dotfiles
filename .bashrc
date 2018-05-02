#! bin/bash

# Set bash options
# ----------------------------------------------------------------------------
shopt -s checkwinsize # update window size after each command
shopt -s histappend # append to history file
PROMPT_DIRTRIM=2

# Basic enviroment variables
# ----------------------------------------------------------------------------
export EDITOR=vim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
# unlimited bash history
export HISTSIZE=
export HISTFILESIZE=
# color to terminal
export CLICOLOR=1

# PATH and other includes
# ----------------------------------------------------------------------------
# add gnuutils to path and man path
# export to manpath to make them available to subprocesss
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# load scripts
PATH="~/bin:~/Cloud/scripts/linux:$PATH"
# namd
PATH="/Users/rohan/Documents/namd:$PATH"

# bash completion
if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
elif [ -f //usr/local/etc/bash_completion  ]; then
    . /usr/local/etc/bash_completion
elif [ -f /etc/bash_completion  ]; then
    . /etc/bash_completion
fi

# add fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

[ -f /usr/share/fzf/shell/key-bindings.bash ] && source /usr/share/fzf/shell/key-bindings.bash

# TERMINAL OPEN ACROSS OS
# ----------------------------------------------------------------------------
case "$OSTYPE" in
    cygwin*)
        alias open="cmd /c start"
        ;;
    linux*)
        alias start="xdg-open"
        alias open="xdg-open"
        ;;
    darwin*)
        alias start="open"
        ;;
esac

red='\[\033[0;31m\]'
green='\[\033[0;32m\]'
yellow='\[\033[0;33m\]'
purple='\[\033[0;35m\]'
white='\[\033[0;37m\]'
blue='\[\033[0;34m\]'
cyan='\[\033[0;36m\]'
NC='\[\033[0m\]'

# PS1
# ----------------------------------------------------------------------------
if [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
    export PS1="$yellow\u$NC@$yellow\H $purple\w $cyan\$( __git_ps1 '(%s)' )$NC\n$ "
else
    export PS1="$yellow\u$NC@$yellow\H $purple\w $NC\n$ "
fi

# ITerm title
# ----------------------------------------------------------------------------
export PROMPT_COMMAND='echo -ne "\033]0;$PWD\007"'

# Souce other files
# ----------------------------------------------------------------------------

# surfraw variables
export SURFRAW_text_browser=w3m
export SURFRAW_graphical=no

# source bash aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# source bash aliases
if [ -f ~/.private_aliases ]; then
    . ~/.private_aliases
fi


