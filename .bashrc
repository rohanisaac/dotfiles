# setup os specific stuff
# -----------------------
# open and vpn
case "$OSTYPE" in
    cygwin*)
        alias open="cmd /c start"
        ;;
    linux*)
        alias start="xdg-open"
        alias open="xdg-open"
        alias vpn="/opt/cisco/anyconnect/bin/vpn"
        alias vpnc="/opt/cisco/anyconnect/bin/vpn connect vpn.unc.edu"
        alias vpnd="/opt/cisco/anyconnect/bin/vpn disconnect"
        ;;
    darwin*)
        alias start="open"
        PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
        ;;
esac

# parse_git_branch() {
#          git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'

# }
# export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "



# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

[ -f /usr/local/etc/bash_completion  ] && . /usr/local/etc/bash_completion

# set up terminal prompt
# PS1="[\u@\h:\w] $ "
# change xterm title to cwd ..
case $TERM in
    xterm*)
        # PS1="[e]0;wa]\$ "
        PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}:${PWD/#$HOME/~}\007"'
    ;;
esac


# powerline
# if powerline exists using 
# http://stackoverflow.com/questions/592620/check-if-a-program-exists-from-a-bash-script
if command -v powerline-daemon >/dev/null 2>&1; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    case "$OSTYPE" in
        linux*)
            if [ -f /usr/share/powerline/bash/powerline.sh ]; then
                . /usr/share/powerline/bash/powerline.sh
            fi
            if [ -f /usr/share/powerline/bindings/bash/powerline.sh  ]; then
                . /usr/share/powerline/bindings/bash/powerline.sh
            fi
            ;;
        darwin*)
            . /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
            ;;
        esac
fi

# -----------------------

if [ -f /usr/bin/vimx ]; then
    alias vi='vimx'
    alias vim='vimx'
elif [ -f /usr/bin/vim ]; then
    alias vi='vim'
fi



# searching
# use qfind "*.ipynb"
alias qfind="find . -name "
alias findinfile="grep -rnw . -e "
alias grep="grep --color=auto --ignore-case --context=1"
alias tree="tree --dirsfirst -C"
alias diff_folder="diff -rq --exclude='.git' "

# load scripts
# export PATH=~/Cloud/scripts/linux:$PATH

# some common aliases
alias ls="ls -G --color=auto"
alias ll="ls -GAlh --color=auto"
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

# common paths
alias afsgal="cd /afs/cas.unc.edu/classes/fall2016/astr_703_001/"

# load scripts
export PATH=~/Cloud/scripts/linux:$PATH

# ranger
# open in folder last in ranger
alias ranger='ranger --choosedir=$HOME/rangerdir; LASTDIR=`cat $HOME/rangerdir`; cd "$LASTDIR"'

# bash completion
if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion  ]; then
    . /etc/bash_completion
fi

# python/conda stuff

# use single quotes so that the variables are escaped, i.e. don't expand on defn, but on use

alias astro="source activate astro"
alias py="source activate scipy"
alias dv="source deactivate"
alias nb="jupyter notebook"
alias ana='export PATH=~/anaconda3/bin:$PATH'
alias res="source activate research"
alias em="emacs --no-window"

# source bash aliases
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

