" ctnfig file for Neovim
filetype indent plugin off
if !&compatible
  set nocompatible
endif

let configDir='~/.config/nvim'

set encoding=utf-8
set ambiwidth=double
set history=1000

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set autoindent
set smartindent
set showbreak=>>>\ 
autocmd filetype quickrun setlocal showbreak=""
set list
set nofixendofline
" set listchars=tab:\¦\
set listchars=tab:>-,trail:-,extends:>
set diffopt+=vertical

set helplang=ja,en

" indent widh
augroup Indent
  autocmd FileType nim setlocal softtabstop=2 shiftwidth=2
  autocmd FileType yaml setlocal softtabstop=2 shiftwidth=2
  autocmd FileType php setlocal tabstop=4 shiftwidth=4 noexpandtab
  autocmd FileType html setlocal tabstop=2 shiftwidth=2
  autocmd FileType freepascal setlocal softtabstop=2 shiftwidth=2
  autocmd FileType markdown setlocal softtabstop=2 shiftwidth=2
  autocmd FileType vim setlocal softtabstop=2 shiftwidth=2
  autocmd FileType javascript setlocal softtabstop=2 shiftwidth=2
  autocmd FileType json setlocal softtabstop=2 shiftwidth=2
  autocmd FileType typescript setlocal softtabstop=2 shiftwidth=2
  autocmd FileType sh setlocal softtabstop=2 shiftwidth=2
  autocmd FileType bash setlocal softtabstop=2 shiftwidth=2
  autocmd FileType c setlocal softtabstop=3 shiftwidth=3 noexpandtab
  autocmd FileType rust setlocal softtabstop=4 shiftwidth=4
augroup END

" shebang auto insert
augroup Shebang
  autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python3\<nl># -*- coding: utf-8 -*-\<nl>\"|$
  autocmd BufNewFile *.php 0put =\"<?php\" | 2
  autocmd BufNewFile *.lua 0put =\"#!/usr/bin/env lua5.3\" | 2
  autocmd BufNewFile *.rb 0put =\"#!/usr/bin/env ruby\" | 2
  autocmd BufNewFile *.sh 0put =\"#!/bin/sh\" | 2
  autocmd BufNewFile *.bash 0put =\"#!/usr/bin/env bash\" | 2
  autocmd BufNewFile *.pas 0put =\"program \" .  expand(\"%:r\") . \";\" | 2
  autocmd BufNewFile *.\(cc\|hh\) 0put =\"//\<nl>// \".expand(\"<afile>:t\").\" -- \<nl>//\<nl>\"|2|start!
augroup END

set nobackup
set noswapfile
set hidden
set autoread

set wrap
set display=lastline
set virtualedit=block

if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif

augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END

"let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" search
set hlsearch
set incsearch
set smartcase
set ignorecase

set inccommand=split

set wrapscan
nnoremap <silent> <Esc><Esc> :<C-u>set nohlsearch!<CR>

set mouse=""
set ruler
set number
set wildmenu
set wildmode=list:full
" set wildoptions+=pum
" set pumblend=20
" set cursorline
set showcmd
set title
set showmatch
set matchtime=1

" runtime macros/matchit.vim
" vim-matchup
" let g:loaded_matchit = 1

set foldlevel=100

set laststatus=2
set clipboard=unnamed,unnamedplus
" set clipboard+=unnamedplus
autocmd InsertLeave * set nopaste

" Keymap
let mapleader = "\<Space>"
nnoremap <kplus> <C-a>
nnoremap <kMinus> <C-x>
nnoremap + <C-a>
nnoremap - <C-x>

" C-CR in middle of line
inoremap <C-j> <Esc>o
inoremap <C-CR> <Esc>o

nnoremap ZZ <nop>
nnoremap ZQ <nop>
nnoremap Q <nop>

nmap <Space>y :%y<CR>

tnoremap <silent> <Esc> <C-\><C-n>
tnoremap <silent> <C-[> <C-\><C-n>

nnoremap gj j
nnoremap gk k
nnoremap j gj
nnoremap k gk
vnoremap gj j
vnoremap gk k
vnoremap j gj
vnoremap k gk

inoremap <C-c> <Esc>

nnoremap <S-h> ^
nnoremap <S-l> $
vnoremap <S-h> ^
vnoremap <S-l> $

" search selected
vnoremap * "zy:let @/ = @z<CR>n
" Window manage
nnoremap <S-M-j> :split<CR>
nnoremap <S-M-l> :vsplit<CR>

inoremap <C-n> \n
nmap m %

vnoremap { (
vnoremap } )

nnoremap <C-j> }
nnoremap <C-k> {

command! Z :qa!

" close on q
autocmd FileType qf,help nmap <buffer> <silent> q :q<CR>

if has('mac')
  nnoremap <silent> <Space>l :silent !chrome-tab-reload-mac<CR><CR>
else
  nnoremap <silent> <Space>l :silent !chrome-tab-reload<CR><CR>
endif

nnoremap <C-g> :Rg 

" Emmet{{{
let g:user_emmet_leader_key = '<C-y>'
let g:user_emmet_install_global = 1
autocmd Filetype php,html,css,scss EmmetInstall
let g:user_emmet_mode = 'i'
let g:user_emmet_expandabbr_key='<C-e>'
let g:user_emmet_settings = {
  \ 'variables': {
  \   'lang': "ja"
  \ },
\ }


" :W = save with root permission
command -nargs=0 -complete=augroup -bang W w !sudo tee % > /dev/null

" OCaml
let g:opam_share = substitute(system('opam config var share'),'\n$','','''')

let g:merlin_completion_dwim = 0
let g:merlin_completion_arg_type = 'never'
let g:merlin_ignore_warnings = 'true'

augroup OCaml_ide
  autocmd FileType ocaml nnoremap <Space>t :MerlinTypeOf <CR>
  autocmd FileType ocaml vnoremap <Space>t :MerlinTypeOfSel <CR>
  autocmd FileType ocaml nnoremap <C-]> :MerlinLocate <CR>
  autocmd Filetype ocaml let g:deoplete#complete_method = 'complete'
augroup END

" load in dein
execute 'set rtp^=' . g:opam_share . '/ocp-indent/vim'
execute 'set rtp+=' . g:opam_share . '/ocp-index/vim'

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
  let g:rc_dir  = expand('~/.config/nvim/dein')
  let s:toml  = g:rc_dir . '/.dein.toml'
  let s:lazy_toml = g:rc_dir . '/.dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,    {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  call dein#add(g:opam_share . '/merlin/vim', {'lazy': 1, 'on_ft': 'ocaml'})

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

" deoplete
let g:deoplete#enable_at_startup = 1

" inoremap <expr><tab> () "\<C-n>""
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
let g:deoplete#auto_complete_start_length = 2
let g:deoplete#enable_camel_case = 0
let g:deoplete#enable_ignore_case = 0
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_refresh_always = 0
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#max_list = 20

if !exists('g:deoplete#ignore_sources')
  let g:deoplete#ignore_sources = {}
endif
let g:deoplete#ignore_sources.ocaml = ['buffer', 'around', 'member', 'tag']

"set completeopt+=noinsert
let g:tern_request_timeout = 1

" vim-closetag
let g:closetag_filenames = '*.html, *.xhtml, *.phtml, *.php'
let g:closetag_xhtml_filenames = '*.xhtml, *.jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

" elzr/vim-json
let g:vim_json_syntax_conceal = 0

" json parse
command! -nargs=? Jq call s:Jq(<f-args>)
function! s:Jq(...)
  if 0 == a:0
    let l:arg = "."
  else
    let l:arg = a:1
  endif
  execute "%! jq \"" . l:arg . "\""
endfunction

"" neosnippet

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <expr><C-n>
  \ pumvisible() ? "\<C-n>" :
  \ neosnippet#expandable_or_jumpable() ?
  \  "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

smap <expr><C-n> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

let g:neosnippet#snippets_directory = '~/.config/nvim/snippets/'

" quickrun
map <silent> <Space>r :QuickRun -input =@+<CR>

" バッファを下に出す
" フォーカスをバッファ側に
  "\ 'runner' : 'vimproc',
let g:quickrun_config = {
  \ '_': {
    \ 'split': '',
    \ 'outputter/buffer/into': '1',
  \},
\}

let g:quickrun_config.nim = {
  \ 'cmdopt': 'c --run --verbosity:0 --warning[SmallLshouldNotBeUsed]:off -d:ssl --hints:off',
\}

let g:quickrun_config.freepascal = {
  \ 'command': 'fpr',
\}

let g:quickrun_config.forth = {
  \ 'exec': 'gforth %s -e bye'
\}

let g:quickrun_config.haskell = {
  \ 'command': 'stack',
  \ 'exec': '%c %o %s %a',
  \ 'cmdopt': 'runghc'
\}

let g:quickrun_config.rust = {
  \ 'command': 'rustc',
  \ 'exec': ['%c %o %s -o %s:p:r', '%s:p:r %a'],
  \ 'cmdopt': '-A dead_code',
\}

let g:quickrun_config.ocaml = {
  \ 'command': 'obrun',
  \ 'exec': ['%c %o %s'],
  \ 'cmdopt': '-quiet -cflags -w,-24',
  \ 'tempfile': '%{tempname()}.ml',
\}


set splitbelow

autocmd FileType markdown map <Space>r :!typora "%:p" >/dev/null 2>&1 &<CR><CR>
autocmd FileType html map <Space>r :!google-chrome "%:p" >/dev/null 2>&1 &<CR><CR>

" NerdTree
nnoremap <Space>n :NERDTreeToggle<CR>
" ファイルが指定されていない場合，NERDTreeを開く
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" vim-Autopair
let g:AutoPairsMapBS = 1
let g:AutoPairs = {'(':')', '[':']', '{':'}', '"""':'"""', '`': '`'}
autocmd FileType forth let g:AutoPairs = {'(':')',  '{':'}', '`':'`', 'T{':'}T'}
autocmd FileType ruby let b:AutoPairs = AutoPairsDefine({"|": "|"})
autocmd FileType rust let b:AutoPairs = AutoPairsDefine({"|": "|"})
autocmd FileType nim let b:AutoPairs = AutoPairsDefine({'{.': '.}'})
autocmd FileType ocaml let b:AutoPairs = AutoPairsDefine({
  \ '(*': '*)', '(**':'**)', '[|':'|]', 'match':'with'
\})

" nvim-nim
" disable key config
let g:nvim_nim_enable_default_binds = 0
let g:nvim_nim_deps_nim = "~/.choosenim/toolchains/nim-0.19.2/lib/"
" FIXME: 以下3つの変数は、明示的に設定されていない場合、プラグイン内で既定値が設定されるようになっているはずだが効いていない
" plugin/nim.vim: 98, 103
let g:nvim_nim_enable_custom_textobjects = 1
let g:nvim_nim_highlighter_enable = 0
let g:nvim_nim_highlighter_semantics = []

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" jedi-vim
" no preview
autocmd FileType python setlocal completeopt-=preview

" deoplete_rust
let g:deoplete#sources#rust#racer_binary='~/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='~/.cargo/rust-source/rust/src'

" ale
" rcmdnk.com/blog/2017/09/25/computer-vim/
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 1
let g:ale_cache_executable_check_failures = 0
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 0
let g:ale_lint_on_enter = 1
let g:ale_completion_delay = 150
let g:ale_linters = {
  \ 'css': ['csslint'],
  \ 'javascript': [],
  \ 'python': ['flake8'],
\}
  " \ 'rust': ['rustc'],

let g:ale_fixers = {
  \ 'javascript': ['prettier'],
  \ 'typescript': ['prettier'],
  \ 'rust': ['rustfmt'],
  \ 'python': ['autopep8', 'isort'],
  \ 'ocaml': ['ocp-indent'],
\}
  " \ 'ocaml': ['ocamlformat'],

" nmap <C-j> <Plug>(ale_next_wrap)
" nmap <C-k> <Plug>(ale_previous_wrap)
nnoremap <C-e><C-r> :lopen<CR>

" Autopair
let g:AutoPairsFlyMode = 0
let g:AutoPairsMultilineClose = 0

" vim-signify
let g:signify_disable_by_default = 0
let g:signify_vcs_list = ['git']
let g:signify_update_on_bufenter = 0
nmap <S-j> <plug>(signify-next-hunk)
nmap <S-k> <plug>(signify-prev-hunk)

" easy-align
vmap <C-l> <Plug>(EasyAlign)

" wakatime
let g:wakatime_PythonBinary = '~/.pyenv/shims/python'

" open zeal
nnoremap <silent> <Space>s :execute '!zeal ' . &filetype . ':' . expand("<cexpr>") . ' &' <CR><CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
"xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
"nmap ga <Plug>(EasyAlign)

" nnoremap <F8> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>

syntax enable
filetype indent plugin on
set secure

