# Search vor neovim, fallback to vim
if [ -f /usr/local/bin/nvim ]; then
  export VISUAL=/usr/local/bin/nvim
elif [ -f /usr/local/bin/vim ]; then
  export VISUAL=/usr/local/bin/vim
else
  export VISUAL=vim
fi

export EDITOR=$VISUAL

# Oh My ZSH
export ZSH="$HOME/.oh-my-zsh"

# Ensure dotfiles bin directory is loaded first
export PATH="$HOME/.bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export ANDROID_HOME=/usr/local/opt/android-sdk

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Local config
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local

