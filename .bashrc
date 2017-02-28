# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=10000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

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
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi

#if [ "$color_prompt" = yes ]; then
	PS1='\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$\[\033[00m\] '
#else
#	PS1='\h:\w\$ '
#fi


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


## User
alias naut='nautilus .'
alias open='nautilus .'
alias off='shutdown -h 0'
alias br='nvim ~/.bashrc'
alias nvr='nvim ~/.config/nvim/init.vim'
alias n='nvim'
alias vr='vim ~/.vimrc'
alias dein='nvim ~/.dein/.dein.toml'
alias deinlazy='nvim ~/.dein/.dein_lazy.toml'
alias py='python3'
alias py2='python2'
alias rb='ruby'
alias irb='irb --simple-prompt'
alias sbr='source ~/.bashrc'
alias rename='rename -v'
alias lua='lua5.3'
alias byo='byobu'
alias du='du -h'

# typo
alias al='la'
alias ala='la'
alias lal='la'
alias sls='ls'
alias lsl='ls'
alias ka='la'
alias ks='ls'
alias cdla='la'
alias cdls='ls'
alias cdcd='cd'
alias lla='la'
alias sl='ls'
alias c=':'
alias d=':'
alias a='la'
alias nvmi='nvim'
alias nivm='nvim'
alias nim='nvim'
alias dc=':'
alias uanr='unar'


# Git
alias ga='git add'
alias gc='git commit'
alias gs='git status'
alias gpom='git push origin master'
alias gcl='git clone'
alias gl='git log'
alias glo='git log --oneline --graph --decorate'


shopt -s autocd
set -o emacs
set noclobber

export TERM=xterm-256color

# Translate
function dict() {
	if [ -e ~/Documents/Memo/gene-utf8.txt ]; then
		grep $1 ${HOME}/Documents/Memo/gene-utf8.txt -A 1 -wi --color
	else
		curl http://www.namazu.org/~tsuchiya/sdic/data/gene95.tar.gz >> ~/Downloads/gene95.tar.gz && tar xfvz ~/Documents/gene95.tar.gz -C ~/Downloads && nkf ~/Downloads/gene.txt >> ~/Documents/Memo/gene-utf8.txt
	fi
}

function jtoe() {
	grep $1 ${HOME}/Documents/Memo/gene-utf8.txt -B 1 -w --color
}

# less syntax highlight
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS='-R'
