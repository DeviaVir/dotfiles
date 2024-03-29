#zlogin
[ -f "$HOME/.zlogin" ] && source "$HOME/.zlogin"

#bash
[ -f "$HOME/.bash_profile" ] && source "$HOME/.bash_profile"

#oh-my-zsh
ZSH=$HOME/.oh-my-zsh
DEFAULT_USER="chase"
DISABLE_AUTO_UPDATE="false"
COMPLETION_WAITING_DOTS="true"
plugins=(git git-extras mosh vi-mode systemd docker-compose)
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

# ls -> exa
alias ls=exa --group

# there will be time to write sudo when I'm dead
alias pacman='sudo pacman'

# go to git root
alias wd='cd `git rev-parse --show-toplevel`'

# switch gcloud
alias gcloudswitch='gcloud config set account $(git config user.email)'

# custom work things
#[ -f "/etc/bashrc_fitbit" ] && source /etc/bashrc_fitbit

# defaults
export EDITOR=/usr/bin/vim
export LC_CTYPE=en_US.utf-8
export CC=/usr/bin/gcc
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export VAGRANT_SYNCHED_FOLDER=/home/chase/
export VAGRANT_MEMORY_SIZE=3084
export ELECTRON_TRASH=trash-cli
export GO111MODULE=on
export GOROOT=/usr/lib/go
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

#powerline
#pl_python_path=$(pip show powerline-status | grep Location | sed 's/Location: //g')
#pl_zsh_module=${pl_python_path}/powerline/bindings/zsh/powerline.zsh
#[ -f "$pl_zsh_module" ] && source "$pl_zsh_module"

#nvm
export NVM_DIR="/home/chase/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#travis
[ -f "$HOME/.travis/travis.sh" ] && source "$HOME/.travis/travis.sh"

#rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

#pyenv
[[ -s "$HOME/.pyenv/bin/pyenv" ]] && eval "$(pyenv init -)"

# GPG Agent Setup - If connected locally
if [ -z "$SSH_TTY" ]; then

	# setup local gpg-agent with ssh support and save env to fixed location
	# so it can be easily picked up and re-used for multiple terminals
	envfile="$HOME/.gnupg/gpg-agent.env"
	if [[ ! -e "$envfile" ]] || ( \
	       # deal with changed socket path in gnupg 2.1.13
	       [[ ! -e "$HOME/.gnupg/S.gpg-agent" ]] && \
	       [[ ! -e "/var/run/user/$(id -u)/gnupg/S.gpg-agent" ]]
	   );
	then
	    killall gpg-agent
	    gpg-agent --daemon --enable-ssh-support > $envfile
	fi

	#gpg-connect-agent killagent /bye
	#gpg-connect-agent updatestartuptty /bye

	# Get latest gpg-agent socket location and expose for use by SSH
	export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket) 

	# Wake up smartcard to avoid races
	gpg --card-status > /dev/null 2>&1
fi

# If running remote via SSH
if [ ! -z "$SSH_TTY" ]; then

    # Copy gpg-socket forwarded from ssh to default location
    # This allows local gpg to be used on the remote system transparently.
    # Strongly discouraged unless GPG managed with a touch-activated GPG
    # smartcard such as a Yubikey 4.
    # Also assumes local .ssh/config contains host block similar to:
    # Host someserver.com
    #     ForwardAgent yes
    #     StreamLocalBindUnlink yes
    #     RemoteForward /home/user/.gnupg/S.gpg-agent.ssh /home/user/.gnupg/S.gpg-agent
    if [ -e $HOME/.gnupg/S.gpg-agent.ssh ]; then
        mv $HOME/.gnupg/S.gpg-agent{.ssh,}
    elif [ -e "/var/run/user/$(id -u)/gnupg/S.gpg-agent" ]; then
         mv /var/run/user/$(id -u)/gnupg/S.gpg-agent{.ssh,}
    fi
    # Ensure existing sessions like screen/tmux get latest ssh auth socket
    # Use fixed location updated on connect so in-memory location always works
    if [ ! -z "$SSH_AUTH_SOCK" -a \
        "$SSH_AUTH_SOCK" != "$HOME/.ssh/agent_sock" ];
    then
        unlink "$HOME/.ssh/agent_sock" 2>/dev/null
        ln -s "$SSH_AUTH_SOCK" "$HOME/.ssh/agent_sock"
    fi
    export SSH_AUTH_SOCK="$HOME/.ssh/agent_sock"
fi

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
alias kc='kubectl kc'
alias k='kubectl'

# history search
bindkey -e
bindkey "\e[A" history-beginning-search-backward
bindkey "\e[B" history-beginning-search-forward
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

# opam configuration
test -r /home/chase/.opam/opam-init/init.zsh && . /home/chase/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# ruby
eval "$(rbenv init -)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/chase/.local/opt/google-cloud-sdk/path.zsh.inc' ]; then . '/home/chase/.local/opt/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/chase/.local/opt/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/chase/.local/opt/google-cloud-sdk/completion.zsh.inc'; fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/chase/.anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/chase/.anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/chase/.anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/chase/.anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
export PATH="${PATH}:${HOME}/.krew/bin"

source <(kubectl completion zsh)
source <(kubectl kc completion zsh)
