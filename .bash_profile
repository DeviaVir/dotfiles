#
# ~/.bash_profile
#

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

[ -f "/etc/bashrc_fitbit" ] && source /etc/bashrc_fitbit

export TERM=screen-256color
export EDITOR=vim
export VISUAL=$EDITOR

# make sure this is an interactive session, then start tmux
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && ~/.tmux_bootstrap
[[ -f "$HOME/.bashrc" ]] && source "$HOME/.bashrc"
