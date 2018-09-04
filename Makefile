help:
	echo "See source for details"

all: link install

link:
	ln -vsi ${PWD}/.bash_aliases ${HOME}/.bash_aliases
	ln -vsi ${PWD}/.bash_profile ${HOME}/.bash_profile
	ln -vsi ${PWD}/.bashrc ${HOME}/.bashrc
	ln -vsi ${PWD}/.git-prompt.sh ${HOME}/.git-prompt.sh
	ln -vsi ${PWD}/.inputrc ${HOME}/.inputrc
	ln -vsi ${PWD}/.screenrc ${HOME}/.screenrc
	ln -vsi ${PWD}/.tmux.conf ${HOME}/.tmux.conf
	ln -vsi ${PWD}/.vimrc ${HOME}/.vimrc

install:
	# Install Vundle and FZF from the respective git repos
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
