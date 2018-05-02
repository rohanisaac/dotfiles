# .bash_profile

PATH="/usr/local/sbin:$PATH"
PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH

if [ -f ~/.bashrc  ]; then
   source ~/.bashrc
fi


