"NeoVim settings
let g:loaded_gzip			   = 1
let g:loaded_tar			   = 1
let g:loaded_tarPlugin		   = 1
let g:loaded_zip			   = 1
let g:loaded_zipPlugin		   = 1
let g:loaded_rrhelper		   = 1
let g:loaded_2html_plugin	   = 1
let g:loaded_vimball		   = 1
let g:loaded_vimballPlugin	   = 1
let g:loaded_getscript		   = 1
let g:loaded_getscriptPlugin   = 1
let g:loaded_netrw			   = 1
let g:loaded_netrwPlugin	   = 1
let g:loaded_netrwSettings	   = 1
let g:loaded_netrwFileHandlers = 1

"Stntastic
"let g:syntastic_alwayspopulate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_check = ['flake8']

"Emmet
let g:user_emmet_leader_key =  '<C-Z>'
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"indent
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']

"deoplete
let g:deoplete#enable_at_startup = 1
"no matcheparen
if !has('gui_running')
	let g:loaded_matchparen = 1
endif

"in English
if has("multi_lang")
language C
endif

"autocommand
if has("autocmd")
filetype off
endif

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

"
"augroup set_kp_help
"	autocmd FileType vim setlocal keywordprg=:help
"augroup END


"mapping

"increment,decrement
nnoremap <kPlus> <C-a>
nnoremap <kMinus> <C-x>
nnoremap + <C-a>
nnoremap - <C-x>
let mapleader =","

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
inoremap <C-j><C-k> <Esc>

nnoremap <S-h> ^
nnoremap <S-l> $

map <C-s> <nop>
nnoremap Q <nop>

"cursor nop
vnoremap  <Up>	   <nop>
vnoremap  <Down>   <nop>
vnoremap  <Left>   <nop>
vnoremap  <Right>  <nop>
noremap   <Up>	   <nop>
noremap   <Down>   <nop>
noremap   <Left>   <nop>
noremap   <Right>  <nop>
inoremap   <Up>		<nop>
inoremap   <Down>	<nop>
inoremap   <Left>	<nop>
inoremap   <Right>	<nop>

"mouse nop
set mouse=""

" dein settings {{{
if &compatible
	set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
"dein.vim diredtory
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
"if not exist git clone
if !isdirectory(s:dein_repo_dir)
	execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state('~/.cache/dein')
	call dein#begin('~/.cache/dein')
"manege plugins
	let s:toml = '~/.dein/.dein.toml'
	let s:lazy_toml = '~/.dein/.dein_lazy.toml'
	call dein#load_toml(s:toml, {'lazy': 0})
	call dein#load_toml(s:lazy_toml, {'lazy': 1})

	call dein#end()
	call dein#save_state()
endif

if dein#check_install(['vimproc'])
	call dein#install(['vimproc'])
endif

if dein#check_install()
	call dein#install()
endif
" }}}

":W = save with root
command -nargs=0 -complete=augroup -bang W w !sudo tee % > /dev/null

"NERDTree
nmap <C-n><C-t> :NERDTreeToggle<CR>

"denite map
nmap <C-n><C-r> :<C-u>Denite file_rec<CR>
nmap <C-n><C-g> :<C-u>Denite grep<CR>
nmap <C-n><C-f> :<C-u>Denite line<CR>

"ColorScheme
colorscheme molokai
let g:molokai_original=1
set t_Co=256
set background=dark
autocmd ColorScheme molokai highlight Visual ctermbg=242
autocmd ColorScheme molokai highlight Comment Ctermfg=102

syntax on

filetype indent plugin on

set secure

