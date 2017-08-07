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

export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:/usr/local/tools
export GITROOT=$HOME/Git
export EDITOR=vim

export XDG_CONFIG_HOME=$HOME/.config
export GNUSTEP_USER_DEFAULTS_DIR=/etc/GNUstep/GNUstep.conf

export TRANSCEND=/media/mika/TRANSCEND
#imwheel 1>/dev/null 2>/dev/null
imwheel >/dev/null 2>&1

# thinkpad touchpad acceleration
xinput --set-prop "pointer:SynPS/2 Synaptics TouchPad" "Device Accel Constant Deceleration" 1.5

# thinkpad touchpad natural scroll
synclient VertScrollDelta=-99
