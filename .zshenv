export EDITOR=vim
export TZ='Europe/Amsterdam'
export QT_DEVICE_PIXEL_RATIO=auto
export PYENV_ROOT="$HOME/.pyenv"
export GOPATH=~/.local/lib/go
export TASKDDATA=$HOME/.config/taskd
export LIBVA_DRIVER_NAME=nvidia

# gcloud
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# nvm
export NVM_DIR="$HOME/.nvm"
export BOLOS_SDK="$HOME/.local/opt/nanos-secure-sdk"
export BOLOS_ENV="$HOME/.local/opt/bolos_env"

# oh-my-zsh
export ZSH_CUSTOM="$HOME/.oh-my-zsh-custom"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

path=("$PYENV_ROOT/bin" $path)
path=("$HOME/.local/bin" $path)
path=("$(ruby -e 'puts Gem.user_dir')/bin" $path)
path=("$HOME/.rvm/bin" $path)
path=("$HOME/.pyenv/shims:$HOME/.pyenv/bin" $path) # Add pyenv
path=("$HOME/.local/lib/go/bin" $path)
path=("/bin/false" $path)
path=("$HOME/vendor/bin" $path)
path=("$HOME/.scripts" $path)
path=("$HOME/.gem/ruby/3.0.0/bin" $path)
path=("/opt/cuda/bin", $path)
path=("$HOME/.cargo/bin", $path)
path=("$HOME/.krew/bin", $path)
path=($^path(N)) # remove paths that don't exist

# device specific env kept out of git
[ -f ~/.device ] && source ~/.device
