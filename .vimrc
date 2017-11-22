" ----------------------------------------------------------------------------
" Plugins
" ----------------------------------------------------------------------------
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf
set rtp+=/usr/local/opt/fzf
call vundle#begin()

" Essential
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sensible'  " Better defaults
Plugin 'tpope/vim-surround' " complete brackets/quotes
Plugin 'jiangmiao/auto-pairs'  " insert brackets in pairs
Plugin 'ervandew/supertab'    " autocomplete with tabs
Plugin 'tpope/vim-commentary'  "easy comments

" Appearence
Plugin 'vim-airline/vim-airline'  " better status bar
Plugin 'vim-airline/vim-airline-themes'  " Associated themes
Plugin 'tomasr/molokai' " Theme
Plugin 'nathanaelkane/vim-indent-guides' " Show indent tabs
Plugin 'ntpeters/vim-better-whitespace'  " Highlights trailing, :StripWhitespace
Plugin 'kien/rainbow_parentheses.vim' " highligts associated ()

" Other
Plugin 'junegunn/vim-easy-align' "easy alignment
Plugin 'thinca/vim-fontzoom'  " Zoom with mouse or C-+ in GVIM
Plugin 'airblade/vim-gitgutter'  " git diff on the left
Plugin 'junegunn/fzf.vim'
Plugin 'vimwiki/vimwiki'

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
set cursorline
let python_highlight_all=1

" Replace concealed text by a single character
" Don't conceal anything
if has("conceal")
    set conceallevel=2
endif

" spell stuff with <leader>-s
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

" Rainbow parenthesis
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" vimwiki options
let wiki_misc = {'path': '~/Cloud/vimwiki/misc/', 'syntax': 'markdown', 'ext': '.md'}
let wiki_res = {'path': '~/Cloud/vimwiki/research/', 'syntax': 'markdown', 'ext': '.md'}
let wiki_teach = {'path': '~/Cloud/vimwiki/teaching/', 'syntax': 'markdown', 'ext': '.md'}
let g:vimwiki_list = [wiki_misc, wiki_res, wiki_teach]

"Gui options turn off toolbar
set guioptions=

" Show invisible characters with <leader>-l
nmap <leader>l :set list!<CR>
if v:version >= 740
    set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·
endif
if v:version < 740
    set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,nbsp:·
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
set softtabstop=4
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
