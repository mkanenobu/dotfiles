# 色を使用
autoload -Uz colors
colors
PROMPT='%F{010}%B%n%F{white}%b:%F{012}%B%~%F{white}%b$ '
#PS1='\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$\[\033[00m\] '
# 補完
autoload -Uz compinit
compinit
bindkey -e
setopt share_history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt auto_cd
setopt correct
# 大文字を入力したときは小文字の候補を補完しない
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
# Ctrl+rでヒストリーのインクリメンタルサーチ、Ctrl+sで逆順
bindkey '^r' history-incremental-pattern-search-backward
bindkey '^s' history-incremental-pattern-search-forward

### Ls Color ###
# 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad
# ZLS_COLORSとは?
export ZLS_COLORS=$LS_COLORS
# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

### Glob ###
setopt extended_glob # グロブ機能を拡張する
unsetopt caseglob    # ファイルグロブで大文字小文字を区別しない

setopt auto_pushd
setopt pushd_ignore_dups

setopt hist_ignore_all_dups


alias ls='ls --color=auto'
#alias dir='dir --color=auto'
#alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'


## User alias
#alias off='shutdown -h 0'
alias br='nvim ~/.bashrc'
alias bf='nvim ~/.bash_functions'
alias nvr='nvim ~/.config/nvim/init.vim'
alias zr='nvim ~/.zshrc'
alias szr='source ~/.zshrc'
alias so='source'
alias mkdir='mkdir -p'
alias n='nvim'
alias vr='vim ~/.vimrc'
alias dein='nvim ~/.dein/.dein.toml'
alias deinlazy='nvim ~/.dein/.dein_lazy.toml'
alias py='python3'
alias py2='python2'
alias nimc='nim c'
alias nimcr='nim c -r'
alias sbr='source ~/.bashrc'
alias spr='source ~/.profile'
alias rename='rename -v'
alias lua='lua5.3'
alias byo='byobu'
alias du='du -h'
alias diff='icddiff -U 1 --line-number'
alias duc='du -h --max-depth=1'
alias screensaver='cmatrix -a'
alias toxclip='xclip -selection clipboard'

# typo
alias al='sl -e'
alias ka='la'
alias ks='ls'
alias c=':'
alias d=':'
alias a='la'
alias dc=':'
alias sl='sl -e'

# Git
alias ga='git add'
alias gc='git commit'
alias gd='git diff'
alias gcm='git commit -m'
alias gs='git status'
alias gpom='git push origin master'
alias gcl='git clone'
alias gl='git log'
alias glo='git log --oneline --graph --decorate'


if [ -f ~/.bash_functions ];then
    . ~/.bash_functions
fi


