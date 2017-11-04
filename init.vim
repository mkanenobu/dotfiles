" In English
"if has("multi_lang")
"    language ja_JP.utf8
"endif

filetype indent plugin off
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" Autocommand
if has("autocmd")
    filetype off
endif


filetype off
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

" disable auto comment
augroup auto_comment_off
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=r
    autocmd BufEnter * setlocal formatoptions-=o
augroup END

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

" replace
if has('nvim')
    set inccommand=split
endif


set wrapscan
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

set wildmode=list,full

"
set ruler
set number
"set cursorline
set wildmenu
set showcmd
set title
set showmatch
" expand match
let loaded_matchparen = 1
source $VIMRUNTIME/macros/matchit.vim

" fold
" don't autofold
set foldlevel=100

nnoremap % m
nnoremap m %

" Tab
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=0
set smarttab
set autoindent
set smartindent
" Indent guide
set list
set listchars=tab:>-,trail:-,extends:>


" Status line
set laststatus=2
set clipboard=unnamed,unnamedplus


"" Keymap

" Increment,decrement
nnoremap <kPlus> <C-a>
nnoremap <kMinus> <C-x>
nnoremap + <C-a>
nnoremap - <C-x>

"set pastetoggle=<C-t>
autocmd InsertLeave * set nopaste

nnoremap ZZ <nop>
nnoremap ZQ <nop>
nnoremap Q <nop>

"nnoremap Y y$
"nnoremap y$ Y

tnoremap <silent> <Esc> <C-\><C-n>
tnoremap <silent> <C-[> <C-\><C-n>

noremap gj j
noremap gk k
noremap j gj
noremap k gk
nnoremap ; :
" disable input method
nnoremap : ::
inoremap <C-c> <Esc>

nnoremap <S-h> ^
nnoremap <S-l> $
vnoremap <S-h> ^
vnoremap <S-l> $


" window manage

" split window
nnoremap <S-M-j> :split<CR>
nnoremap <S-M-l> :vsplit<CR>

"close other than current window
nnoremap <M-o> <C-w>o

" switch window
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l

" open file (Denite)
nmap :e :Denite dile


" disable mouse
set mouse=""

" dein settings {{{
if has('nvim')
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

    "if dein#check_install(['vimproc'])
    "   call dein#install(['vimproc'])
    "endif

    if dein#check_install()
        call dein#install()
    endif
    " }}}
endif

"Emmet
let g:user_emmet_leader_key =  '<C-Y>,'
let g:user_emmet_install_global = 0
let g:user_emmet_mode = 'iv'
autocmd FileType html,css,scss,php EmmetInstall
let g:user_emmet_expandabbr_key = '<C-e>'

"NERDTree
nmap <C-n><C-t> :NERDTreeToggle<CR>

"vim-quickrun
" \r

"denite map
nmap <C-w> :<C-u>Denite file_rec<CR>
"nmap <C-w> :<C-u>Denite grep<CR>
nmap <C-n><C-f> :<C-u>Denite line<CR>

"no matcheparen
"if !has('gui_running')
"   let g:loaded_matchparen = 1
"endif

":W = save with root
command -nargs=0 -complete=augroup -bang W w !sudo tee % > /dev/null

"deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> () "\<C-n>"
inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ deoplete#mappings#manual_complete()
        function! s:check_back_space() abort "{{{
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~ '\s'
        endfunction"}}}
        
inoremap <silent><expr> <S-TAB>
        \ pumvisible() ? "\<C-p>" :
        \ <SID>check_back_space() ? "\<S-TAB>" :
        \ deoplete#mappings#manual_complete()
        function! s:check_back_space() abort "{{{
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~ '\s'
        endfunction"}}}

let g:deoplete#auto_complete_delay = 0
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_camel_case = 0
let g:deoplete#enable_ignore_case = 0
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_refresh_always = 0
"let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#max_list = 30
"set completeopt+=noinsert
"let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
"let g:deoplete#ignore_sources.php = ['omni']
let g:tern_request_timeout = 1

let g:LangageClient_autoStart = 1

"ColorScheme
autocmd ColorScheme molokai highlight Visual ctermbg=242
autocmd ColorScheme molokai highlight Comment ctermfg=102
autocmd ColorScheme molokai highlight Search ctermbg=242 ctermfg=15
colorscheme molokai
let g:molokai_original=1
"set background=dark

syntax on

filetype indent plugin on

set secure

" neoterm
let g:neoterm_position = 'vertical'
" Neomake
" List errors
nnoremap <C-e><C-r> :lopen<CR>
" When writing a buffer.
call neomake#configure#automake('w')
" When writing a buffer, and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 750)
" When reading a buffer (after ns), and when writing.
call neomake#configure#automake('rw', 750)

