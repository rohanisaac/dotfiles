" ----------------------------------------------------------------------------
" Plugins
" ----------------------------------------------------------------------------
call plug#begin()

" Essential
Plug 'tpope/vim-sensible'  " Better defaults
Plug 'tpope/vim-surround' " complete brackets/quotes
" Plug 'tpope/vim-unimpaired'  "other mappings ex ]b [b for moving around buffers
" Plug 'tpope/vim-repeat' " use . after surround etc.
Plug 'ervandew/supertab'    " autocomplete with tabs
Plug 'tpope/vim-commentary'  "easy comments
Plug 'junegunn/fzf.vim'

" Appearence
" Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
" Plug 'vim-airline/vim-airline'  " better status bar
Plug 'itchyny/lightline.vim'
" Plug 'flazz/vim-colorschemes'
" Plug 'nathanaelkane/vim-indent-guides' " Show indent tabs
" Plug 'ntpeters/vim-better-whitespace'  " Highlights trailing, :StripWhitespace
" Plug 'kien/rainbow_parentheses.vim' " highligts associated ()

" Other
Plug 'junegunn/vim-easy-align' " easy alignment, in visual mode eg:ga=
Plug 'airblade/vim-gitgutter'  " git diff on the left

" Programming language
" Plug 'sheerun/vim-polyglot'  " large language support
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }  " autocomplete faster than jedi-vim
" Plug 'davidhalter/jedi-vim'  " autocomplete bindings for below
Plug 'davidhalter/jedi'  " autocomplete for python
call plug#end()

" ----------------------------------------------------------------------------
" Basic settings
" Press Shift-K over something to find out what it does
" ----------------------------------------------------------------------------
set background=dark
if (has("termguicolors"))
    set termguicolors
endif
colorscheme gruvbox
set encoding=utf-8
set showcmd
set clipboard=unnamed  " set vim==system clipboard
set number " add line numbers
set cursorline
set colorcolumn=80
set spell spelllang=en_us
set nospell
set nobackup
" set omnifunc=syntaxcomplete#Complete

" Search options: search while typing, and highlight all; taken from manual
set ignorecase
try
    augroup vimrc-incsearch-highlight
      autocmd!
      autocmd CmdlineEnter /,\? :set hlsearch
      autocmd CmdlineLeave /,\? :set nohlsearch
    augroup END
catch
    " Do nothing
endtry

" spell stuff with <leader>-s
nmap <Leader>s :setlocal spell! spelllang=en_us<CR>

" Indent guide stuff
" let g:indent_guides_guide_size=1
" let g:indent_guides_start_level=2
" let g:indent_guides_enable_on_vim_startup=1

" Airline settings
" let g:airline_powerline_fonts=1
" let g:airline#extensions#tabline#enabled=1

" " GUI options
" if has('mac')
"     set guifont=Source\ Code\ Pro\ Light:h13
" elseif has('unix')
"     set guifont=Source\ Code\ Pro\ 10
" endif
" set guioptions= " Gui options turn off toolbar

" Rainbow parenthesis
" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces

try
    " Show invisible characters with <leader>-l
    set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·
    nmap <leader>l :set list!<CR>
catch
    " Do nothing
endtry

" ----------------------------------------------------------------------------
" FZF shortcuts
" ----------------------------------------------------------------------------
nmap <leader>f :Files<cr>
nmap <leader>/ :BLines<cr>
nmap <leader>b :Buffers<cr>
nmap <leader>r :Rg 
nmap <leader>c :Commands<cr>

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

" let g:ycm_python_interpreter_path = '/home/rohan/anaconda3/bin/python'

" ----------------------------------------------------------------------------
" latex settings
" ----------------------------------------------------------------------------
" let g:LatexBox_viewer='zathura'
" let g:LatexBox_latexmk_preview_continuously=1
" let g:LatexBox_quickfix=2 
