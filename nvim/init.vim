" ctnfig file for Neovim
filetype indent plugin off

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
set showbreak=>>\ 
autocmd filetype quickrun setlocal showbreak=""
set list
set nofixendofline
" set listchars=tab:\¦\
set listchars=tab:>-,trail:-,extends:>
set diffopt+=vertical

set helplang=ja,en

" set filetype by extension
augroup Set_filetype
  autocmd!
  autocmd BufNewFile,BufReadPost,FileReadPost *.vader set filetype=vim
  autocmd BufNewFile,BufReadPost,FileReadPost .dein.toml set filetype=vim
  autocmd BufNewFile,BufReadPost,FileReadPost *.fsx set filetype=fsharp
  autocmd BufNewFile,BufReadPost,FileReadPost *.hx set filetype=java
  autocmd BufNewFile,BufReadPost,FileReadPost *.nims set filetype=nim
augroup END

" indent width
augroup Indent_setting
  autocmd!
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
  autocmd FileType lisp setlocal softtabstop=2 shiftwidth=2
augroup END

" shebang auto insert
augroup Shebang_insert
  autocmd!
  autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python3\<nl># -*- coding: utf-8 -*-\<nl>\"|$
  autocmd BufNewFile *.php 0put =\"<?php\" | 2
  autocmd BufNewFile *.lua 0put =\"#!/usr/bin/env lua5.3\" | 2
  autocmd BufNewFile *.rb 0put =\"#!/usr/bin/env ruby\" | 2
  autocmd BufNewFile *.sh 0put =\"#!/bin/sh\" | 2
  autocmd BufNewFile *.bash 0put =\"#!/usr/bin/env bash\" | 2
  autocmd BufNewFile *.pas 0put =\"program \" .  expand(\"%:r\") . \";\" | 2
augroup END

set nobackup
set noswapfile
set hidden
set autoread

set wrap
set linebreak
set display=lastline
" set virtualedit=block

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
set wildmode=list,longest,full
set wildmenu
" set wildoptions+=pum
" set pumblend=20
" set cursorline
set showcmd
set title
set showmatch
set matchtime=1

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
nnoremap <Down> gj
nnoremap <Up> gk

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
vmap m %
" nnoremap % m

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

" :W = save with root permission
command -nargs=0 -complete=augroup -bang W w !sudo tee % > /dev/null

" OCaml
let g:opam_share = substitute(system('opam config var share'),'\n$','','''')


      " \ let g:merlin_completion_arg_type = 'never' |
augroup ocaml_settings
  autocmd!
  autocmd FileType ocaml nnoremap <Space>t :MerlinTypeOf <CR> |
      \ vnoremap <Space>t :MerlinTypeOfSel <CR> |
      \ nnoremap <C-]> :MerlinLocate <CR> |
      \ nnoremap <Space>n :MerlinGrowEnclosing <CR> |
      \ nnoremap <Space>p :MerlinShrinkEnclosing <CR> |
      \ set completeopt-=preview |
      \ let g:deoplete#complete_method = 'complete' |
      \ let g:merlin_completion_dwim = 0 |
      \ let g:merlin_ignore_warnings = 'false' |
      \ let g:merlin_completion_with_doc = 'true' |
      \ let b:match_words = "<begin>:<end>,<object>:<end>" |
augroup END


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


if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:rc_dir = expand('~/.config/nvim/dein')
  let s:toml = g:rc_dir . '/.dein.toml'
  let s:lazy_toml = g:rc_dir . '/.dein_lazy.toml'

  call dein#load_toml(s:toml)
  call dein#add(g:opam_share . '/merlin/vim', {'lazy': 1, 'on_ft': 'ocaml'})

  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

colorscheme molokai
augroup molokai_colorscheme
  autocmd!
  " 微調整
  autocmd ColorScheme molokai highlight Visual ctermbg=242 |
      \ highlight Comment ctermfg=102 |
      \ highlight Search ctermbg=242 ctermfg=15 |
      \ highlight MatchParen ctermbg=242 ctermfg=15
augroup END


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

" <CR>: close popup and save indent.
function! s:my_cr_function() abort
  return deoplete#close_popup() . "\<CR>"
endfunction
imap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>

let g:deoplete#enable_camel_case = 0
let g:deoplete#enable_ignore_case = 0
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#max_list = 20

if !exists('g:deoplete#ignore_sources')
  let g:deoplete#ignore_sources = {}
endif

let g:deoplete#ignore_sources.ocaml = ['around', 'tag', 'buffer']
augroup deoplete_completion_settings
  autocmd!
  call deoplete#custom#source('around', 'mark', '[Around]')
  call deoplete#custom#source('syntax', 'mark', '[Syntax]')
  call deoplete#custom#source('ale', 'mark', '[Ale]')
  call deoplete#custom#source('tabnine', 'mark', '[TabNine]')
  call deoplete#custom#source('ocaml', 'mark', '[OCaml]')
  call deoplete#custom#source('neosnippet', 'mark', '[NeoSnippet]')

  call deoplete#custom#source('around', 'rank', 50)
  call deoplete#custom#source('syntax', 'rank', 50)
  call deoplete#custom#source('neosnippet', 'rank', 75)
  call deoplete#custom#source('ale', 'rank', 100)
  call deoplete#custom#source('tabnine', 'rank', 0)
augroup END

" set completeopt+=noinsert
let g:tern_request_timeout = 1

"" neosnippet
" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


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

let g:quickrun_config.lisp = {
  \ 'command': 'sbcl',
  \ 'exec': ['%c --script %s'],
\}

set splitbelow

augroup space_r
  autocmd!
  autocmd FileType markdown map <Space>r :!typora "%:p" >/dev/null 2>&1 &<CR><CR>
  autocmd FileType html map <Space>r :!google-chrome "%:p" >/dev/null 2>&1 &<CR><CR>
augroup END

" NerdTree
" ファイルが指定されていない場合，NERDTreeを開く
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" " lexima for customizable endwise
" " disable basic rules (use AutoPair)
" let g:lexima_enable_basic_rules = 0
" let g:lexima_enable_newline_rules = 0
"
" " lexima endwise settings
" function! s:make_endwise_rule(at, end, filetype)
"   call lexima#add_rule({
"   \ 'char': '<CR>',
"   \ 'input': '<CR>',
"   \ 'input_after': '<CR>' . a:end,
"   \ 'at': a:at,
"   \ 'except': '\C\v^(\s*)\S.*%#\n%(%(\s*|\1\s.+)\n)*\1' . a:end,
"   \ 'filetype': a:filetype,
"   \ 'syntax': [],
" \ })
" endfunction
" call s:make_endwise_rule('\<\%(for\|while\)\>.*\%#', 'done', 'ocaml')
" call s:make_endwise_rule('^\s*(begin\|object)\>.*\%#', 'end', 'ocaml')


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
  \ 'python': [],
  \ 'ruby': ['ruby', 'solargraph'],
\}
  " \ 'rust': ['rustc'],
  " \ 'python': ['flake8'],

let g:ale_fixers = {
  \ 'javascript': ['prettier'],
  \ 'typescript': ['prettier'],
  \ 'rust': ['rustfmt'],
  \ 'python': ['isort', 'autopep8'],
  \ 'ocaml': ['ocp-indent', 'trim_whitespace'],
  \ 'ruby': ['standardrb'],
\}
  " \ 'ocaml': ['ocamlformat'],

" nmap <C-j> <Plug>(ale_next_wrap)
" nmap <C-k> <Plug>(ale_previous_wrap)
nnoremap <C-e><C-r> :lopen<CR>

" vim-signify
let g:signify_disable_by_default = 0
let g:signify_vcs_list = ['git']
let g:signify_update_on_bufenter = 0
" nmap <S-j> <plug>(signify-next-hunk)
" nmap <S-k> <plug>(signify-prev-hunk)

" easy-align
" vmap <C-l> <Plug>(EasyAlign)

" wakatime
let g:wakatime_PythonBinary = '~/.pyenv/shims/python'

" open zeal
nnoremap <silent> <Space>s :execute '!zeal ' . &filetype . ':' . expand("<cexpr>") . ' &' <CR><CR>

" nnoremap <F8> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>

" Util
function! SynGroup()
  let l:s = synID(line('.'), col('.'), 1)
  echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

command! WC :%s/./&/gn


syntax enable
filetype indent plugin on
set secure

