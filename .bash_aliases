#!/bin/bash
# ALIASES
# ----------------------------------------------------------------------------

if [ -f /usr/bin/vimx ]; then
    alias vi='vimx'
    alias vim='vimx'
elif [ -f /usr/bin/vim ]; then
    alias vi='vim'
fi

# pine
alias pine=alpine

# searching
# use qfind "*.ipynb"
alias qfind="find . -name "
alias findinfile="grep -rnw . -e "
alias grep="grep --color=auto --ignore-case --context=1"
alias tree="tree --dirsfirst -C"
alias diff_folder="diff -rq --exclude='.git' "

# some common aliases
alias ls="ls -G --color=auto"
alias ll="ls -Glh --color=auto"
alias ..="cd .."
alias ...="cd ../../"
alias ....="cd ../../../"
alias ~="cd ~"
alias cd..="cd .."
alias type="type -all"
alias du="du -h"
alias df="df -h"

# protect operations
alias cp="cp -iv"
alias mv="mv -iv"
# alias rm="rm -Iv"  # too risky

# list directory upoon cd
cdl() { builtin cd "$@"; ls; }

# network stuff
alias ping="ping -c 4"

# extract archives
extract() { 
    if [ -f $1 ] ; then 
      case $1 in 
        *.tar.bz2)   tar xjf $1     ;; 
        *.tar.gz)    tar xzf $1     ;; 
        *.bz2)       bunzip2 $1     ;; 
        *.rar)       unrar e $1     ;; 
        *.gz)        gunzip $1      ;; 
        *.tar)       tar xf $1      ;; 
        *.tbz2)      tar xjf $1     ;; 
        *.tgz)       tar xzf $1     ;; 
        *.zip)       unzip $1       ;; 
        *.Z)         gunzip $1      ;; 
        *.7z)        7z x $1        ;; 
        *)     echo "'$1' cannot be extracted via extract()" ;; 
         esac 
     else 
         echo "'$1' is not a valid file" 
     fi 
}

# ranger
# open in folder last in ranger
alias ranger='ranger --choosedir=$HOME/rangerdir; LASTDIR=`cat $HOME/rangerdir`; cd "$LASTDIR"'

# python/conda stuff
# ----------------------------------------------------------------------------
# use single quotes so that the variables are escaped, i.e. don't expand on defn, but on use

alias astro="source activate astro"
alias py="source activate scipy"
alias dv="source deactivate"
alias nb="jupyter notebook --browser=firefox"
function ana {
    echo "Adding Anaconda python"
	export PATH=~/anaconda3/bin:$PATH
    which python
    python --version
}
function ipy {
    export PATH=~/anaconda3/bin:$PATH
    ipython -i ~/Cloud/scripts/linux/research-ipy-start.py
}
alias res="source activate research"
alias em="emacs --no-window"

# software specific
alias csd="source /Applications/CCDC/Python_API_2017/miniconda/bin/activate"

alias vpn="/opt/cisco/anyconnect/bin/vpn"
alias vpnc="/opt/cisco/anyconnect/bin/vpn connect vpn.unc.edu"
alias vpnd="/opt/cisco/anyconnect/bin/vpn disconnect"

alias units=gunits
alias vmd='/Applications/VMD\ 1.9.3.app/Contents/Resources/VMD.app/Contents/MacOS/VMD'

## Killdevil stuff
alias sub='bsub -q week -n 16 -R "span[hosts=1]"'
alias cassub='busb -q week -n 16 -R "span[hosts=1]" ./castep-script.x'
alias cambridge='. ~/scripts/cambridge.sh'
alias gview='. ~/scripts/gview.sh'
alias gausssub='bsub -q week -x -R "span[hosts=1]" -n 16 g09'
