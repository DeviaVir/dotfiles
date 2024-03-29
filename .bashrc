#
# ~/.bashrc
#

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
export http_proxy=''
export https_proxy=''
export ftp_proxy=''
export socks_proxy=''
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# Automatically added by the Guix install script.
if [ -n "$GUIX_ENVIRONMENT" ]; then
    if [[ $PS1 =~ (.*)"\\$" ]]; then
        PS1="${BASH_REMATCH[1]} [env]\\\$ "
    fi
fi

