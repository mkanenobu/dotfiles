# ~omsg "git added".bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

TERM=xterm-256color
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

HISTCONTROL=erasedups
# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=10000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -u checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

#if [ "$color_prompt" = yes ]; then
#   PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
#   PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi

# Original

# if return error, change prompt color
RETURN_CODE='\[$(
if [ $? -eq 0 ]; then
    echo -en \e[\033[00m\];
else
    echo -en \e[31m; fi; echo -en $\e[m;)\]'
PS1='\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]'
PS1="${PS1}${RETURN_CODE} "
PS2='>'

if [ -z "$TMUX" ]; then
  PS1='\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\W\[\033[01;34m\]$(__git_ps1)\[\033[00m\]\$\[\033[00m\] '
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

. ~/.env

## User aliases
alias off='shutdown -h 0'
alias br='nvim ~/.bashrc'
alias bf='nvim ~/.bash_functions'
alias so='source'
alias mkdir='mkdir -p'
alias nvr='nvim ~/.config/nvim/init.vim'
alias vi='vim'
alias vim='nvim'
alias n='nvim'
alias e='emacs25-nox'
alias erc='emacs25-nox ~/.emacs'
alias dein='nvim ~/.dein/.dein.toml'
alias deinlazy='nvim ~/.dein/.dein_lazy.toml'
alias sbr='source ~/.bashrc'
alias spr='source ~/.profile'
alias sbf='source ~/.bash_functions'
alias rename='rename -v'
alias diff='icdiff -U 1 --line-number'
alias copy='xclip -selection clipboard'
alias pbcopy='xclip -selection clipboard'
alias ly='lilypond'
alias ftp-ncftp='ncftp'
alias lockscreen='xflock4'
alias youtube-mps='mpsyt'
alias show_audio_spec='soxinfo'
alias opn='open'
alias fpc='fpc2'
alias freepascal='fpc2'
alias ssh-keygen-pub='ssh-keygen -yf'
alias op='open'
alias fd='fd -H'
alias psfind='ps aux | fzf'
alias pip3='sudo -H pip3'
alias pip='sudo -H pip'
alias lame='lame -b 192'
alias vg='volt get'

# Shell utils
alias duc='du -d 1 -h | sort -h'
alias wcj='wc -m'
alias mv='mv -i'
alias cp='cp -i'
alias fzf='fzf --reverse'
alias cat='bat'

# languages
alias py='python3'
alias nimc='nim c'
alias nimcd='nim c -d:release'
alias nimcr='nim c -r --verbosity:0'
alias nimi='nim secret'
alias rc='rustc'
alias ghr='runghc'
alias lua='lua5.3'
alias luac='luac5.3'
alias fth='pforth'

# vagrant
alias vu='vagrant up'
alias vh='vagrant halt'
alias vs='vagrant ssh'
alias vr='vagrant reload'

# typo
alias al='sl -e'
alias a=':'
alias d=':'
alias sl='sl -e'
alias claer="clear"

# Git
alias g='git'
alias ga='git add'
alias gcm='git commit -m'
alias gcd='git commit -m "$(date +%D)"'
alias gs='git status'
alias gp='git pull'
alias gpo='git push origin'
alias gd='git diff'
alias gcl='git clone'
alias gg='git grep'
alias gc='git checkout'
alias gb='git branch'
alias gpom='echo "Use gpo master"'
alias gf='git fetch'
alias gst='git stash'
alias gsp='git stash pop'

alias tmux-kill='tmux kill-server'

shopt -s autocd
set -o emacs
# リダイレクトによる上書き禁止
# >|を用いればリダイレクトできる
set -C noclobber


# tmuxで履歴を共有しつつ重複を削除
share_history(){
    history -a
    # ここから追記
    tac ~/.bash_history | awk '!a[$0]++' | tac >| ~/.bash_history.tmp
    mv -f ~/.bash_history{.tmp,}
    # ここまで追記
    history -c
    history -r
}

# PROMPT_COMMAND='share_history; git_autofetch'
shopt -u histappend

if [ -f ~/.bash_functions ];then
    . ~/.bash_functions
fi

# Complete suggests
_encopus(){
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $(compgen -W "$(ls *.wav)" -- $cur) )
}
complete -F _encopus encopus

_nimr(){
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $(compgen -W "$(ls *.nim)" -- $cur) )
}
complete -F  _nimr nimr

. ~/.env
/usr/bin/setxkbmap -option "ctrl:nocaps"

xmodmap ~/.Xmodmap

# stop ctrl-s panic
stty stop undef

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
