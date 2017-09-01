#! bin/bash

# Basic exports
# ----------------------------------------------------------------------------
export EDITOR=vim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# PATH and other includes
# ----------------------------------------------------------------------------
# add gnuutils to path and man path
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# load scripts
PATH="~/Cloud/scripts/linux:$PATH"

# bash completion
if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
elif [ -f //usr/local/etc/bash_completion  ]; then
    . /usr/local/etc/bash_completion
elif [ -f /etc/bash_completion  ]; then
    . /etc/bash_completion
fi

# add fzf
# [ -f ~/.fzf.bash ] && source ~/.fzf.bash

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
	export PS1="$yellow\u$NC@$yellow\h: $purple\w $cyan\$( __git_ps1 '(%s)' )$NC:\n$ "
else
	export PS1="$yellow\u$NC@$yellow\h: $purple\w $NC:\n$ "
fi

# fix bugs
# ----------------------------------------------------------------------------
# Fix backspace bug on xterm
stty erase '^?'
# Souce other files
# ----------------------------------------------------------------------------


# source bash aliases
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

# source bash aliases
if [ -f ~/.private_aliases ]; then
. ~/.private_aliases
fi
