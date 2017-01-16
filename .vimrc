set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Better defaults
Plugin 'tpope/vim-sensible'

"Git stuff
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

"visual stuff
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'  
Plugin 'yggdroot/indentline'

"Fuzzy file finder
Plugin 'kien/ctrlp.vim'

"highlight whitespace
Plugin 'ntpeters/vim-better-whitespace'

"complete brackets/quotes
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'

" Scroll stuff
Plugin 'ScrollColors'
Plugin 'terryma/vim-smooth-scroll'

"Code stuff
"Plugin 'hynek/vim-python-pep8-indent'  "autopep8
Plugin 'scrooloose/syntastic' "syntax check
Plugin 'davidhalter/jedi-vim' "autocomplete
Plugin 'ervandew/supertab'    "with tabs
Plugin 'tpope/vim-commentary'  "easy comments
Plugin 'majutsushi/tagbar'   "view tags
"Latex support
"Plugin 'lervag/vimtex'

"Todo
Plugin 'vitalk/vim-simple-todo'

"CSV file support
Plugin 'chrisbra/csv.vim'

"Make work with tmux
Plugin 'christoomey/vim-tmux-navigator'
call vundle#end()            " required
filetype plugin indent on    " required

set encoding=utf-8
set clipboard=unnamed " set vim==system clipboard
set backspace=2 " make work like traditional backspace
set hlsearch  " highlight all search results <C-L> to clear
set background=light
set number " add line numbers
colorscheme molokai
set colorcolumn=80
set spell spelllang=en_us

"make tabs be replaced by 4 spaces
set tabstop=8
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab

"Turn off condensing latex symbols on the active line
set cole=0

"Powerline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
if has('mac')
    set guifont=Inconsolata\ for\ Powerline:h16
elseif has('unix')
    set guifont=Inconsolata\ for\ Powerline\ 12
endif
let g:airline_theme='luna'

"Gui options turn off toolbar
set guioptions=

"Smooth scroll functions
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

"Add python pep8 standards
source ~/.vimrc_python 
