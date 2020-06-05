# ~/.bash_aliases CONFIGURATION FILE

alias open=xdg-open

# SOFTWARE
# ----------------------------------------------------------------------------

# vim
if [ -f /usr/bin/nvim ]; then
    alias vi=nvim
    alias vim=nvim
elif [ -f /usr/bin/vim ]; then
    alias vi=vim
fi

# pine
alias pine=alpine
alias mc="mc --skin=dark"
alias em="emacs --no-window"

# software specific
alias vpn="/opt/cisco/anyconnect/bin/vpn"
alias vpnc="/opt/cisco/anyconnect/bin/vpn connect vpn.unc.edu"
alias vpnd="/opt/cisco/anyconnect/bin/vpn disconnect"

# searching
# use qfind "*.ipynb"
alias qfind="find . -name "
alias findinfile="grep -rnw . -e "
alias grep="grep --color=auto --ignore-case --context=1"
alias tree="tree --dirsfirst -C"
alias diff_folder="diff -rq --exclude='.git' "

# some common aliases
alias ls="ls --color=auto"
if [ -f /usr/bin/exa ]; then
    alias ll="exa -lh --color=auto --group-directories-first"
    alias la="exa -alh --color=auto --group-directories-first"
else
    alias ll="ls -lh --color=auto --group-directories-first"
    alias la="ls -Alh --color=auto --group-directories-first"
fi
alias recent="ls -t | head -n 5"
alias ..="cd .."
alias ...="cd ../../"
alias ....="cd ../../../"
alias ~="cd ~"
alias cd..="cd .."
alias type="type -all"
alias du="du -h"
alias df="df -h"

# fedora specific
alias dnfi="sudo dnf install"
alias dnfr="sudo dnf remove"

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
        *.tbz)       tar xjf $1     ;; 
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

function av {
    conda_initialize
    echo "Activating $1"    
    conda activate $1
}

alias dv="conda deactivate"
alias aa="conda_initialize"
alias nb="jupyter notebook --browser=firefox"

function ipy {
    ipython -i ~/Cloud/scripts/linux/research-ipy-start.py
}

function pv {
    which python
    python --version
}

function conda_initialize {
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/home/rohan/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/home/rohan/anaconda3/etc/profile.d/conda.sh" ]; then
            . "/home/rohan/anaconda3/etc/profile.d/conda.sh"
        else
            export PATH="/home/rohan/anaconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<
}

if [ -f ~/.slurm_aliases ]; then
	. ~/.slurm_aliases
fi
