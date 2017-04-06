" ----------------------------------------------------------------------------
" Plugins
" ----------------------------------------------------------------------------
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sensible'  " Better defaults
Plugin 'thinca/vim-fontzoom'  " Zoom with mouse or C-+ in GVIM
Plugin 'tpope/vim-fugitive'  " Git ... commands
Plugin 'airblade/vim-gitgutter'  " git diff on the left
Plugin 'vim-airline/vim-airline'  " better status bar
Plugin 'vim-airline/vim-airline-themes'  " Associated themes
Plugin 'flazz/vim-colorschemes'  " Vim colorschemes
"Plugin 'yggdroot/indentline'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'kien/ctrlp.vim' "Fuzzy file finder
Plugin 'ntpeters/vim-better-whitespace'  " Highlights trailing, :StripWhitespace
Plugin 'tpope/vim-surround' "complete brackets/quotes
Plugin 'jiangmiao/auto-pairs'  " insert brackets in pairs
" Plugin 'ScrollColors'  " For playing with colorschemes
Plugin 'terryma/vim-smooth-scroll'
Plugin 'tell-k/vim-autopep8'
"Plugin 'hynek/vim-python-pep8-indent'  "autopep8
Plugin 'scrooloose/syntastic' "syntax check
Plugin 'davidhalter/jedi-vim' "autocomplete
Plugin 'ervandew/supertab'    "with tabs
Plugin 'tpope/vim-commentary'  "easy comments
Plugin 'majutsushi/tagbar'   "view tags
"Plugin 'jmcantrell/vim-virtualenv'
"Plugin 'lervag/vimtex'
Plugin 'vitalk/vim-simple-todo'  " <leader> i, o to create, <leader> x
Plugin 'chrisbra/csv.vim' " CSV file support
Plugin 'christoomey/vim-tmux-navigator' "Make work with tmux
call vundle#end()
filetype plugin indent on

" ----------------------------------------------------------------------------
" Basic settings
" ----------------------------------------------------------------------------

colorscheme molokai
set encoding=utf-8
set clipboard=unnamed  " set vim==system clipboard
set number " add line numbers
set colorcolumn=80
set spell spelllang=en_us

" set background=light
let python_highlight_all=1

"make tabs be replaced by 4 spaces
set tabstop=8
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab

" Replace concealed text by a single character
set conceallevel=1

"Indent guide stuff
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2
let g:indent_guides_enable_on_vim_startup = 1

"Airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
if has('mac')
    set guifont=Inconsolata\ for\ Powerline:h14
elseif has('unix')
    set guifont=Inconsolata\ for\ Powerline\ 10
endif
let g:airline_theme='luna'

"Gui options turn off toolbar
set guioptions=

"Show invisible characters with \l
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
" set listchars=tab:▸\ ,eol:¬
" set lcs+=space:·
" set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣

"Invisible character colors
highlight NonText guifg=#333333
highlight SpecialKey guifg=#333333

"Smooth scroll functions
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" ----------------------------------------------------------------------------
" Python PEP8 standards
" ----------------------------------------------------------------------------
set tabstop=8
set shiftwidth=4
set expandtab
set smarttab
set textwidth=79

" Makefile have to use tabs
au BufRead,BufNewFile Makefile* set noexpandtab
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

filetype indent on
set autoindent
set foldmethod=indent
