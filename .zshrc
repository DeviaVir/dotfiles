#oh-my-zsh
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.oh-my-zsh-custom
DEFAULT_USER="chase"
DISABLE_AUTO_UPDATE="false"
COMPLETION_WAITING_DOTS="true"
plugins=(git git-extras mosh vi-mode docker pass systemd docker docker-compose)
# npm install --global pure-prompt
#autoload -U promptinit; promptinit
#prompt pure
ZSH_THEME="bullet-train"
source $ZSH/oh-my-zsh.sh

HISTFILE=~/.zsh_history
HISTSIZE=100000000
SAVEHIST=100000000
setopt inc_append_history
setopt share_history
unsetopt beep

# Always use gpg2
[ -f /usr/bin/gpg2 ] && alias gpg="/usr/bin/gpg2"

# vi -> vim
alias vi=/usr/bin/vim

# there will be time to write sudo when I'm dead
alias pacman='sudo pacman'

# custom work things
[ -f "/etc/bashrc_fitbit" ] && source /etc/bashrc_fitbit

# defaults
export SSH_AUTH_SOCK=/run/user/$(id -u)/gnupg/S.gpg-agent.ssh
export EDITOR=/usr/bin/vim
export LC_CTYPE=en_US.utf-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export VAGRANT_SYNCHED_FOLDER=/home/chase/
export VAGRANT_MEMORY_SIZE=3084
arch_check='ARCH'
uname=$(uname -a)
if [[ $uname == *"$arch_check"* ]]; then
	xrdb -merge ~/.Xresources
fi

#powerline
pl_python_path=$(pip show powerline-status | grep Location | sed 's/Location: //g')
pl_zsh_module=${pl_python_path}/powerline/bindings/zsh/powerline.zsh
[ -f "$pl_zsh_module" ] && source "$pl_zsh_module"

#travis
[ -f "$HOME/.travis/travis.sh" ] && source "$HOME/.travis/travis.sh"

#rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

#pyenv
[[ -s "$HOME/.pyenv/bin/pyenv" ]] && eval "$(pyenv init -)"

#man theme
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}

# aliases
alias fuck='eval $(thefuck $(fc -ln -1))'
alias FUCK='fuck'
alias ducks='du -cks * | sort -rn | head'
alias md5sum='md5 -r'
alias localandroid='qemu-system-x86_64 -m 2048 -boot d -enable-kvm -smp 3 -net nic -net user -hda android-marshmallow.img'
alias dd.services="( cd ~/Sites/dualdev/services && CONFIG=~/Sites/dualdev/services/config.js USELOCALCORE=~/Sites/dualdev/core/dist npm run dev )"

# history search
bindkey -e
bindkey "\e[A" history-beginning-search-backward
bindkey "\e[B" history-beginning-search-forward
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

