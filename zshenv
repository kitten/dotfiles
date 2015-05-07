# Search vor neovim, fallback to vim
if which nvim >/dev/null; then
  export VISUAL=$(which nvim)
elif which vim >/dev/null; then
  export VISUAL=$(which vim)
else
  export VISUAL=vim
fi

export EDITOR=$VISUAL

# Oh My ZSH
export ZSH="$HOME/.oh-my-zsh"

# Ensure dotfiles bin directory is loaded first
export PATH="$HOME/.bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

# Tmuxifier
export PATH="$HOME/.tmuxifier/bin:$PATH"

export ANDROID_HOME=/usr/local/opt/android-sdk

if which rbenv &>/dev/null ; then
  eval "$(rbenv init - --no-rehash)"
fi

export NVM_DIR=~/.nvm
source $NVM_DIR/nvm.sh

# Local config
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local

