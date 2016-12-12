#
# ~/.bash_profile
#

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

[[ -f ~/.bashrc ]] && . ~/.bashrc

