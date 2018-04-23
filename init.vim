" config file for Neovim
filetype indent plugin off
if &compatible
    set nocompatible
endif

set encoding=utf-8
set ambiwidth=double
set history=1000

set nobackup
set noswapfile
set hidden
set autoread

set wrap
set display=lastline

augroup auto_comment_off
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=r
    autocmd BufEnter * setlocal formatoptions-=o
augroup END

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" search
set hlsearch
set incsearch
set smartcase
set ignorecase

" tag jump
set tags=<tags_path>

set inccommand=split

set wrapscan
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
nnoremap <silent><Space><Space> :<C-u>set nohlsearch!<CR>

set mouse=""
set ruler
set number
set wildmenu
set wildmode=list,full
"set cursorline
set showcmd
set title
set showmatch
set matchtime=1
source $VIMRUNTIME/macros/matchit.vim

set foldlevel=100

nnoremap % m
nnoremap m %

set expandtab
set tabstop=4
set shiftwidth=4
"set softtabstop = 0
set smarttab
set autoindent
set smartindent
set list
"set listchars=tab:\¦\
set listchars=tab:>-,trail:-,extends:>

autocmd filetype nim setlocal softtabstop=2 shiftwidth=2

set laststatus=2
set clipboard=unnamed,unnamedplus
"set clipboard+=unnamedplus
autocmd InsertLeave * set nopaste

" Keymap
nnoremap <kplus> <C-a>
nnoremap <kMinus> <C-x>
nnoremap + <C-a>
nnoremap - <C-x>

nnoremap ZZ <nop>
nnoremap ZQ <nop>
nnoremap Q <nop>

"nnoremap Y y$
"nnoremap y$ Y
nmap <Space>y :%y<CR>

tnoremap <silent> <Esc> <C-\><C-n>
tnoremap <silent> <C-[> <C-\><C-n>

nnoremap gj j
nnoremap gk k
nnoremap j gj
nnoremap k gk
"nnoremap ; :

inoremap <C-c> <Esc>

nnoremap <S-h> ^
nnoremap <S-l> $
vnoremap <S-h> ^
vnoremap <S-l> $

let mapleader = "\<Space>"

" Window manage
nnoremap <S-M-j> :split<CR>
nnoremap <S-M-l> :vsplit<CR>

" PHP
let g:php_baselib=1
let g:php_htmlInStrings=1
let g:php_noShortTags=1
let g:php_sql_query=1

" DB
let g:sql_type_default = 'mysql'


" Emmet{{{
let g:user_emmet_leader_key = '<C-y>'
let g:user_emmet_install_global = 0
let g:user_emmet_mode = 'i'
autocmd Filetype php,html,css,scss EmmetInstall
let g:user_emmet_expandabbr_key='<C-e>'
let g:user_emmet_settings = {
    \    'variables': {
    \      'lang': "ja"
    \    },
    \ }


" :W = save with root permission
"command -nargs=0 -complete=augroup -bang W w !sudo tee % > /dev/null
cabbr W w !sudo tee > /dev/null %

" dein
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    " プラグインリストを収めた TOML ファイル
    " 予め TOML ファイル（後述）を用意しておく
    let g:rc_dir  = expand('~/.dein')
    let s:toml    = g:rc_dir . '/.dein.toml'
    let s:lazy_toml = g:rc_dir . '/.dein_lazy.toml'

    " TOML を読み込み、キャッシュしておく
    call dein#load_toml(s:toml,      {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})

    " 設定終了
    call dein#end()
    call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
    call dein#install()
endif

autocmd ColorScheme molokai highlight Visual ctermbg=242
autocmd ColorScheme molokai highlight Comment ctermfg=102
autocmd ColorScheme molokai highlight Search ctermbg=242 ctermfg=15
autocmd ColorScheme molokai highlight MatchParen ctermbg=242 ctermfg=15
colorscheme molokai
let g:molokai_original = 1
"let g:rehash256 = 1

" deoplete
let g:deoplete#enable_at_startup = 1

inoremap <expr><tab> () "\<C-n>""
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
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#max_list = 30
"set completeopt+=noinsert
let g:tern_request_timeout = 1

" vim-closetag
let g:closetag_filenames = '*.html, *.xhtml, *.phtml, *.php'
let g:closetag_xhtml_filenames = '*.xhtml, *.jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

"" neosnippet

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <expr><C-n>
    \ pumvisible() ? "\<C-n>" :
    \ neosnippet#expandable_or_jumpable() ?
    \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

smap <expr><C-n> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
let g:neosnippet#snippets_directory='~/.nvim/'


" fugitive
nmap <Space>a :Gwrite<CR> :echomsg "git added"<CR>
nnoremap <Space>l :Gblame<CR>
nnoremap <Space>d :Gdiff<CR>

" quickrun
map <Space>r :QuickRun -input =@+<CR>
" バッファを下に出す
" フォーカスをバッファ側に
    "\ 'runner' : 'vimproc',
let g:quickrun_config = {
    \ '_': {
        \ 'split': '',
        \ 'outputter/buffer/into': '1',
    \},
\}
set splitbelow

" NerdTree
map <Space>n :NERDTreeToggle<CR>
" ファイルが指定されていない場合，NERDTreeを開く
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" indentLine
"let g:indentLine_bgcolor_term = 239
"let g:indentLine_setColors = 0
"let g:indentLine_char = 'c'
"let g:indentLine_setConceal = 0

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" jedi-vim 
" no preview
autocmd FileType python setlocal completeopt-=preview

" ale
" rcmdnk.com/blog/2017/09/25/computer-vim/
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_linters = {
    \ 'python': ['flake8'],
\}
let g:ale_fixers = {
    \ 'python': ['autopep8', 'isort'],
\}
nnoremap <C-e><C-r> :lopen<CR>

autocmd BufNewFile,BufRead *.twig set filetype=htmljinja

syntax on
filetype indent plugin on
set secure
