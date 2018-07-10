# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export XDG_CONFIG_HOME="$HOME/.config"
# export GOROOT="$HOME/.go"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$HOME/.nimble/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export GITROOT=$HOME/Git
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/tools"
export PATH="$PATH:$HOME/.config/composer/vendor/bin"
export PATH="$HOME/.cargo/bin:$PATH"
export EDITOR=nvim
# nvim in tmux
export TERM=xterm-256color

# LANG settings
export LC_NUMERIC=ja_JP.UTF-8
export LC_TIME=ja_JP.UTF-8
export LC_MONETARY=ja_JP.UTF-8
export LC_PAPER=ja_JP.UTF-8
export LC_NAME=ja_JP.UTF-8
export LC_ADDRESS=ja_JP.UTF-8
export LC_TELEPHONE=ja_JP.UTF-8
export LC_MEASUREMENT=ja_JP.UTF-8
export LC_IDENTIFICATION=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8
export PAPERSIZE=a4
export LANGUAGE=en_US
export LANG=ja_JP.UTF-8
# ls sorting
export LC_COLLATE=C

export HISTTIMEFORMAT='%F %T '

imwheel >/dev/null 2>&1

# thinkpad touchpad acceleration
xinput --set-prop "pointer:SynPS/2 Synaptics TouchPad" "Device Accel Constant Deceleration" 1.5

# thinkpad touchpad natural scroll
synclient VertScrollDelta=-99
synclient HorizScrollDelta=-99

# Kensington Orbit with Scroll Ring middle click emulation
xinput set-prop "Primax Kensington Eagle Trackball" "libinput Middle Emulation Enabled" 1 >/dev/null 2>&1
#xinput set-prop "Primax Kensington Eagle Trackball" "libinput Middle Button Timeout" 100 >/dev/null #2>&1

export FCITX_NO_PREEDIT_APPS=""
_byobu_sourced=1 . /usr/bin/byobu-launch 2>/dev/null || true

# Discord startup minimize
#wmctrl -c "Discord"


export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
exec ibus-daemon -dx &

# export DISPLAY="${DISPLAY:-:0}"

# caps to ctrl
/usr/bin/setxkbmap -option "ctrl:nocaps"
