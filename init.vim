" config file for Neovim
filetype indent plugin off
if &compatible
  set nocompatible
endif

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
set list
set nofixendofline
" set listchars=tab:\¦\
set listchars=tab:>-,trail:-,extends:>

" indent widh
augroup Indent
  autocmd filetype nim setlocal softtabstop=2 shiftwidth=2
  autocmd filetype yaml setlocal softtabstop=2 shiftwidth=2
  autocmd filetype php setlocal tabstop=4 shiftwidth=4 noexpandtab
  autocmd filetype html setlocal tabstop=4 shiftwidth=4
  autocmd filetype pascal setlocal softtabstop=2 shiftwidth=2
  autocmd filetype markdown setlocal softtabstop=2 shiftwidth=2
  autocmd filetype vim setlocal softtabstop=2 shiftwidth=2
  autocmd filetype javascript setlocal softtabstop=4 shiftwidth=4
  autocmd filetype json setlocal softtabstop=2 shiftwidth=2
  autocmd filetype typescript setlocal softtabstop=2 shiftwidth=2
  autocmd filetype sh setlocal softtabstop=2 shiftwidth=2
  autocmd filetype bash setlocal softtabstop=2 shiftwidth=2
  autocmd filetype c setlocal softtabstop=3 shiftwidth=3 noexpandtab
  autocmd filetype rust setlocal softtabstop=4 shiftwidth=4
augroup END

" shebang auto insert
augroup Shebang
  autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python3\<nl># -*- coding: utf-8 -*-\<nl>\"|$
  autocmd BufNewFile *.php 0put =\"<?php\" | 2
  autocmd BufNewFile *.pl 0put =\"#!/usr/bin/env perl\" | 2
  autocmd BufNewFile *.lua 0put =\"#!/usr/bin/env lua5.3\" | 2
  autocmd BufNewFile *.rb 0put =\"#!/usr/bin/env ruby\<nl># -*- coding: None -*-\<nl>\"|$
  autocmd BufNewFile *.sh 0put =\"#!/bin/sh\" | 2
  autocmd BufNewFile *.bash 0put =\"#!/bin/bash\" | 2
  autocmd BufNewFile *.pas 0put =\"program \" .  expand(\"%:r\") . \";\" | 2
  autocmd BufNewFile *.\(cc\|hh\) 0put =\"//\<nl>// \".expand(\"<afile>:t\").\" -- \<nl>//\<nl>\"|2|start!
augroup END

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

set inccommand=split

set wrapscan
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

set mouse=""
set ruler
set number
set wildmenu
set wildmode=list
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

" for comment

" Keymap
let mapleader = "\<Space>"
nnoremap <kplus> <C-a>
nnoremap <kMinus> <C-x>
nnoremap + <C-a>
nnoremap - <C-x>

" C-CR in middle of line
inoremap <C-j> <Esc>o

nnoremap ZZ <nop>
nnoremap ZQ <nop>
nnoremap Q <nop>

noremap <Leader>p "0p
nmap <Space>y :%y<CR>

inoremap <C-d> $

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
"nnoremap ; :

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
  let s:toml  = g:rc_dir . '/.dein.toml'
  let s:lazy_toml = g:rc_dir . '/.dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,    {'lazy': 0})
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
"colorscheme gruvbox
" set background=dark

" vivid
" let g:molokai_original = 1

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

" call deoplete#custom#source('LanguageClient',
"   \ 'min_pattern_length',
"   \ 2)

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
let g:neosnippet#snippets_directory = '~/.nvim/'

" vim-ref
let g:ref_phpmanual_path = $HOME . '/.nvim/manuals/php-chunked-xhtml'
"let g:ref_use_vimproc = 0

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

let g:quickrun_config.freepascal = {
  \ 'command': 'fpr',
\}

let g:quickrun_config.forth = {
  \ 'command': 'gforthrun',
  \ 'runner': 'shell',
\}
set splitbelow

if expand("%:e") == "md"
  map <Space>r :!typora "%:p" >/dev/null 2>&1 &<CR><CR>
endif
if expand("%:e") == "html"
  map <Space>r :!google-chrome "%:p" >/dev/null 2>&1 &<CR><CR>
endif

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

" nvim-nim
" disable key config
let g:nvim_nim_enable_default_binds = 0

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
let g:ale_cache_executable_check_failures = 0
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_lint_on_enter = 0
let g:ale_completion_delay = 150
let g:ale_linters = {
  \ 'css': ['csslint'],
  \ 'rust': ['rustc'],
  \ 'javascript': [],
\ }
  " \ 'python': ['flake8'],

let g:ale_fixers = {
  \ 'python': ['isort'],
  \ 'perl': ['perltidy'],
  \ 'javascript': ['prettier'],
  \ 'typescript': ['prettier']
\ }
  " \ 'python': ['autopep8', 'isort'],
  " \ 'rust': ['rustfmt'],

let g:rustfmt_autosave = 1


nnoremap <C-e><C-r> :lopen<CR>

" Autopair
let g:AutoPairsFlyMode = 0
let g:AutoPairsMultilineClose = 0

" easy-align
vmap <C-l> <Plug>(EasyAlign)

" Start interactive EasyAlign in visual mode (e.g. vipga)
"xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
"nmap ga <Plug>(EasyAlign)

" lsp
" let g:lsp_signs_enabled = 1
" let g:lsp_diagnostics_echo_cursor = 1
" let g:LanguageClient_devel = 1
" let g:LanguageClient_loggingLevel = 'DEBUG'
" let g:LanguageClient_serverCommands = {
"   \ 'pascal': [],
"   \ 'python': ['pyls'],
"   \ 'php': ['php', '-l'],
" \}

" nnoremap <F8> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>

syntax enable
filetype indent plugin on
set secure
