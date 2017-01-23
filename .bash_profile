#
# ~/.bash_profile
#

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

[ -f "/etc/bashrc_fitbit" ] && source /etc/bashrc_fitbit
[ -f "${HOME}/.bashrc" ] && source ${HOME}/.bashrc
