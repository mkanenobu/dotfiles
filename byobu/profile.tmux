source $BYOBU_PREFIX/share/byobu/profiles/tmux
PS1='\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]'
RETURN_CODE='\[$(
if [ $? -eq 0 ]; then
    echo -en \e[\033[00m\] ;
else
    echo -en \e[31m; fi; echo -en $\e[m;)\] '
PS1="${PS1}""${RETURN_CODE}"
PS2='>'
