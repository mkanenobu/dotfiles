filetype off
filetype indent plugin off

set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-boms,euc-jp,cp932
set fileformats=unix,dos,mac
set ambiwidth=double
set history=5000

set nobackup
set noswapfile

"no matcheparen
if !has('gui_running')
  let g:loaded_matchparen = 1
endif

"in English
if has("multi_lang")
  language C
endif

au BufRead,BufNewFile *.scss set filetype=sass
"
set wrap
set display=lastline

"search
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

"
set ruler
set number
"set cursorline
set wildmenu
"set showcmd
set title
"set showmatch
source $VIMRUNTIME/macros/matchit.vim
nnoremap % m

"Tab
set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=0
set smarttab
set smartindent

"Status line
set laststatus=2

set clipboard=unnamed,unnamedplus
vmap <C-c> :w !xsel -ib<CR><CR>

"mapping

"increment,decrement
nnoremap <kPlus> <C-a>
nnoremap <kMinus> <C-x>
nnoremap + <C-a>
nnoremap - <C-x>

"numeric keypad map
"inoremap <Esc>Oq 1
"inoremap <Esc>Or 2
"inoremap <Esc>Os 3
"inoremap <Esc>Ot 4
"inoremap <Esc>Ou 5
"inoremap <Esc>Ov 6
"inoremap <Esc>Ow 7
"inoremap <Esc>Ox 8
"inoremap <Esc>Oy 9
"inoremap <Esc>Op 0
"inoremap <Esc>On .
"inoremap <Esc>OQ /
"inoremap <Esc>OR 
"inoremap <Esc>Ol +
"inoremap <Esc>OS -
"inoremap <Esc>OM <Enter>

inoremap <C-[> <Esc>
"set pastetoggle=<C-t>
autocmd InsertLeave * set nopaste

nnoremap ZZ <nop>
nnoremap ZQ <nop>

nnoremap Y y$
nnoremap y$ Y

noremap gj j
noremap gk k
noremap j gj
noremap k gk
nnoremap ; :
inoremap <C-j><C-k> <Esc>
inoremap JK <Esc>

nnoremap <S-h> ^
nnoremap <S-l> $

map <C-s> <nop>
nnoremap Q <nop>

"mouse nop
set mouse=""

":W = save with root
command -nargs=0 -complete=augroup -bang W w !sudo tee % > /dev/null

"ColorScheme
colorscheme molokai
"set t_Co=256
autocmd ColorScheme molokai highlight Visual ctermbg=242
autocmd ColorScheme molokai highlight Comment ctermfg=102
autocmd ColorScheme molokai highlight Search ctermbg=242 ctermfg=15
autocmd ColorScheme molokai highlight MatchParen ctermbg=242 ctermfg=15


syntax on
filetype indent plugin on
set secure
