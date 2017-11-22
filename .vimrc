" ----------------------------------------------------------------------------
" Plugins
" ----------------------------------------------------------------------------
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sensible'  " Better defaults
Plugin 'thinca/vim-fontzoom'  " Zoom with mouse or C-+ in GVIM
" Plugin 'tpope/vim-fugitive'  " Git ... commands
Plugin 'airblade/vim-gitgutter'  " git diff on the left
Plugin 'vim-airline/vim-airline'  " better status bar
Plugin 'vim-airline/vim-airline-themes'  " Associated themes
" Plugin 'flazz/vim-colorschemes'  " Vim colorschemes
Plugin 'tomasr/molokai'
"Plugin 'yggdroot/indentline'
Plugin 'nathanaelkane/vim-indent-guides'
" Plugin 'kien/ctrlp.vim' "Fuzzy file finder
Plugin 'junegunn/fzf.vim'
Plugin 'ntpeters/vim-better-whitespace'  " Highlights trailing, :StripWhitespace
Plugin 'tpope/vim-surround' "complete brackets/quotes
Plugin 'jiangmiao/auto-pairs'  " insert brackets in pairs
" Plugin 'ScrollColors'  " For playing with colorschemes
" Plugin 'terryma/vim-smooth-scroll'
" Plugin 'tell-k/vim-autopep8'
"Plugin 'hynek/vim-python-pep8-indent'  "autopep8
" Plugin 'scrooloose/syntastic' "syntax check
" Plugin 'davidhalter/jedi-vim' "autocomplete
Plugin 'ervandew/supertab'    "with tabs
Plugin 'tpope/vim-commentary'  "easy comments
Plugin 'junegunn/vim-easy-align' "easy alignment"
" Plugin 'majutsushi/tagbar'   "view tags
"Plugin 'jmcantrell/vim-virtualenv'
"Plugin 'lervag/vimtex'
Plugin 'kien/rainbow_parentheses.vim'

"Interferes with vimwiki
" Plugin 'vitalk/vim-simple-todo'  " <leader> i, o to create, <leader> x
Plugin 'vimwiki/vimwiki'
" Plugin 'xolox/vim-misc'  " dependency for notes
" Plugin 'xolox/vim-notes'  " notes :Note
" Plugin 'chrisbra/csv.vim' " CSV file support
" Plugin 'christoomey/vim-tmux-navigator' "Make work with tmux
" Plugin 'godlygeek/tabular'

call vundle#end()
filetype plugin indent on

" ----------------------------------------------------------------------------
" Basic settings
" ----------------------------------------------------------------------------

colorscheme molokai
set encoding=utf-8
set showcmd
set clipboard=unnamed  " set vim==system clipboard
set number " add line numbers
if exists("&colorcolumn")
    set colorcolumn=80
endif
set spell spelllang=en_us
set nospell
set hlsearch
" set background=light
set cursorline
let python_highlight_all=1

"make tabs be replaced by 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=0
set smarttab

" Replace concealed text by a single character
" Don't conceal anything
if has("conceal")
    set conceallevel=2
endif

" spell stuff
nmap <Leader>s :setlocal spell! spelllang=en_us<CR>

"Indent guide stuff
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2
let g:indent_guides_enable_on_vim_startup = 1

"Airline settings
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
if has('mac')
    set guifont=Source\ Code\ Pro\ Light:h13
elseif has('unix')
    set guifont=Source\ Code\ Pro\ 10
endif
let g:airline_theme='understated'

" fzf
set rtp+=/usr/local/opt/fzf


" Rainbow parenthesis
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" " Vim notes
" let g:notes_directories = ['~/Cloud/vim_notes']
" let g:notes_smart_quotes = 0
" let g:notes_suffix = '.md'

" vimwiki options
let wiki_misc = {'path': '~/Cloud/vimwiki/misc/', 'syntax': 'markdown', 'ext': '.md'}
let wiki_res = {'path': '~/Cloud/vimwiki/research/', 'syntax': 'markdown', 'ext': '.md'}
let wiki_teach = {'path': '~/Cloud/vimwiki/teaching/', 'syntax': 'markdown', 'ext': '.md'}
let g:vimwiki_list = [wiki_misc, wiki_res, wiki_teach]

"Gui options turn off toolbar
set guioptions=

if exists("&listchars")
    "Show invisible characters with \l
    " Shortcut to rapidly toggle `set list`
    nmap <leader>l :set list!<CR>
    " Use the same symbols as TextMate for tabstops and EOLs
    " set listchars=tab:▸\ ,eol:¬
    " set lcs+=space:
    set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·
    " set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
endif

"Invisible character colors
highlight NonText guifg=#333333
highlight SpecialKey guifg=#333333

"Smooth scroll functions
" noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
" noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
" noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
" noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" ----------------------------------------------------------------------------
" Python PEP8 standards
" ----------------------------------------------------------------------------
set tabstop=8
set shiftwidth=4
set expandtab
set smarttab
" set textwidth=79

" Makefile have to use tabs
au BufRead,BufNewFile Makefile* set noexpandtab
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

filetype indent on
set autoindent
set ignorecase

" Markdown files
au BufNewFile,BufRead *.md  setf markdown
autocmd BufRead,BufNew *.md set filetype=markdown
