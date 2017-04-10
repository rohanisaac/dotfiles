# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/rohan/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# powerline
if [ -f /usr/share/powerline/zsh/powerline.zsh ]; then
    . /usr/share/powerline/zsh/powerline.zsh
fi
if [ -f /usr/share/powerline/bindings/zsh/powerline.zsh  ]; then
    . /usr/share/powerline/bindings/zsh/powerline.zsh
fi

