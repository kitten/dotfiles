# Determine environment
unamestr=`uname -s`
if [[ "$unamestr" == 'Linux' ]]; then
  export isOSX=true
else
  export isOSX=false
fi

# Hostnames
export HOSTNAME="$(hostname)"
export HOSTNAME_SHORT="$(hostname -s)"

# Ensure dotfiles bin directory is loaded first
export PATH="$HOME/.bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

# Better history
export HISTFILE="$HOME/.history/$(date -u +%Y/%m/%d.%H.%M.%S)_${HOSTNAME_SHORT}_$$"

# Search for neovim, fallback to vim
if which nvim >/dev/null; then
  export VISUAL="$(which nvim)"
elif which vim >/dev/null; then
  export VISUAL="$(which vim)"
else
  export VISUAL="vim"
fi

export EDITOR=$VISUAL

# Oh My ZSH
export ZSH="$HOME/.oh-my-zsh"

# tmuxifier
export PATH="$HOME/.tmuxifier/bin:$PATH"
eval "$(tmuxifier init -)"

if [ -d "/usr/local/opt/android-sdk" ]; then
  export ANDROID_HOME=/usr/local/opt/android-sdk
fi

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# nvm
export NVM_DIR=~/.nvm
source $NVM_DIR/nvm.sh

# Local config
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local

