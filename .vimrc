" ----------------------------------------------------------------------------
" Plugins
" ----------------------------------------------------------------------------
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Essential
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sensible'  " Better defaults
Plugin 'tpope/vim-surround' " complete brackets/quotes
" Plugin 'tpope/vim-repeat' " use . after surround etc.
Plugin 'ervandew/supertab'    " autocomplete with tabs
Plugin 'tpope/vim-commentary'  "easy comments

" Appearence
Plugin 'vim-airline/vim-airline'  " better status bar
Plugin 'flazz/vim-colorschemes'
" Plugin 'nathanaelkane/vim-indent-guides' " Show indent tabs
" Plugin 'ntpeters/vim-better-whitespace'  " Highlights trailing, :StripWhitespace
Plugin 'kien/rainbow_parentheses.vim' " highligts associated ()

" Other
Plugin 'junegunn/vim-easy-align' " easy alignment, in visual mode eg:ga=
Plugin 'airblade/vim-gitgutter'  " git diff on the left

call vundle#end()

" ----------------------------------------------------------------------------
" Basic settings
" ----------------------------------------------------------------------------
set background=dark
colorscheme monokain
set encoding=utf-8
set showcmd
set clipboard=unnamed  " set vim==system clipboard
set number " add line numbers
set cursorline
set colorcolumn=80
set spell spelllang=en_us
set nospell
set nobackup
set omnifunc=syntaxcomplete#Complete

" Search options: search while typing, and highlight all; taken from manual
set ignorecase
if v:version > 704
    augroup vimrc-incsearch-highlight
      autocmd!
      autocmd CmdlineEnter /,\? :set hlsearch
      autocmd CmdlineLeave /,\? :set nohlsearch
    augroup END
endif

" spell stuff with <leader>-s
nmap <Leader>s :setlocal spell! spelllang=en_us<CR>

" Indent guide stuff
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2
let g:indent_guides_enable_on_vim_startup=1

" Airline settings
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1

" GUI options
if has('mac')
    set guifont=Source\ Code\ Pro\ Light:h13
elseif has('unix')
    set guifont=Source\ Code\ Pro\ 10
endif
set guioptions= " Gui options turn off toolbar

" Rainbow parenthesis
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


" Show invisible characters with <leader>-l
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·
nmap <leader>l :set list!<CR>

" ----------------------------------------------------------------------------
" Python PEP8 standards
" ----------------------------------------------------------------------------
set tabstop=8
set shiftwidth=4
set expandtab
set smarttab
set softtabstop=4
set textwidth=79

" Makefile have to use tabs
au BufRead,BufNewFile Makefile* set noexpandtab
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

