help:
	@echo "See source for details"

all: link install

conda:
	# Install conda from anaconda.com
	conda update -y conda
	conda install -c conda-forge -y lmfit uncertainties pint peakutils rampy
	conda install -y numpy pandas matplotlib scikit-learn jupyter notebook scipy
	conda update -y --all

link:
	ln -vsi ${PWD}/.bash_aliases ${HOME}/.bash_aliases
	# ln -vsi ${PWD}/.bash_profile ${HOME}/.bash_profile
	ln -vsi ${PWD}/.bashrc ${HOME}/.bashrc
	ln -vsi ${PWD}/.git-prompt.sh ${HOME}/.git-prompt.sh
	ln -vsi ${PWD}/.gitconfig ${HOME}/.gitconfig
	ln -vsi ${PWD}/.inputrc ${HOME}/.inputrc
	ln -vsi ${PWD}/.screenrc ${HOME}/.screenrc
	ln -vsi ${PWD}/.tmux.conf ${HOME}/.tmux.conf
	ln -vsi ${PWD}/.vimrc ${HOME}/.vimrc

install:
	# Install Vundle and FZF from the respective git repos
	git clone --depth 1 https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install
