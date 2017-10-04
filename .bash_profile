#
# ~/.bash_profile
#

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

[ -f "/etc/bashrc_fitbit" ] && source /etc/bashrc_fitbit

export TERM=screen-256color
export EDITOR=vim
export VISUAL=$EDITOR

# make sure this is an interactive session, then start tmux
[[ $- != *i* ]] && return
[[ -f "$HOME/.bashrc" ]] && source "$HOME/.bashrc"
[[ -z "$TMUX" ]] && source "$HOME/.tmux_bootstrap"
