# for osx
alias vi=vim 

# set up terminal prompt
# PS1="[\u@\h:\w] $ "

# powerline stuff
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /Users/rohan/anaconda2/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh

# searching
alias qfind="find . -name "
alias findinfile="grep -rnw . -e "
alias grep="grep --color=auto --ignore-case --context=1"
alias tree="tree --dirsfirst -C"

# python stuff 
alias nb="jupyter notebook"

# some common aliases
alias ls="ls -G"
alias ll="ls -GAlh"
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
        *.Z)         uncompress $1  ;; 
        *.7z)        7z x $1        ;; 
        *)     echo "'$1' cannot be extracted via extract()" ;; 
         esac 
     else 
         echo "'$1' is not a valid file" 
     fi 
}

# afs gal
alias afsgal="cd /afs/cas.unc.edu/classes/fall2016/astr_703_001/"

# conda stuff
alias astro="source activate astro"
alias py="source activate scipy"
alias dv="source deactivate"
