source $HOME/.zshenv

# PLUGS #############################################
if [[ -f $ZPLUG_HOME/init.zsh ]]; then
  source $ZPLUG_HOME/init.zsh

  zplug "tj/n", hook-build:"make install"

  zplug "rupa/z", use:"z.sh"
  zplug "holman/spark", as:command, use:"spark"
  zplug "Goles/Battery", as:command, use:"battery"

  zplug "robbyrussell/oh-my-zsh", use:"lib/*.zsh", nice:5

  zplug "zsh-users/zsh-history-substring-search", nice:10
  zplug "zsh-users/zsh-syntax-highlighting", nice:10
  zplug "plugins/git", from:oh-my-zsh, if:"which git", nice:10
  zplug "plugins/tmux", from:oh-my-zsh, if:"which tmux", nice:10
  zplug "plugins/osx", from:oh-my-zsh, if:"[ $isOSX = true ]", nice:10

  zplug "$HOME/.zsh", from:local, use:"*.zsh*", nice:15

  zplug load
fi
#####################################################

# Fix up aliases for sudo
alias sudo="sudo "

alias ack="ag"

# Preserve Insert Cursor shape in nvim using iterm
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1

# Just use one editor
alias nvim="$EDITOR"
alias vim="$EDITOR"
alias vi="$EDITOR"
alias edit="$EDITOR"

if [ "$isOSX" = true ]; then
  alias less="/usr/local/share/nvim/runtime/macros/less.sh"
  alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
  alias joinpdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'
fi

alias diff="$EDITOR -d"
alias vimdiff="$EDITOR -d"

alias recommit='git commit -a --amend --no-edit'
alias pushf='git push --force-with-lease'

# Disable auto-correct
unsetopt correct_all

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# The Fuck
alias fuck='$(thefuck $(fc -ln -1))'

# My IP
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'

# Docker
if [ $(command -v docker-machine) ]; then
  function dmend () {
    eval "$(docker-machine env -u)"
  }
  function dmenv () {
    eval "$(docker-machine env $@)"
  }
  function dmopen () {
    open "http://$(docker-machine ip $1)"
  }
  function dmip () {
    docker-machine ip $DOCKER_MACHINE_NAME
  }
  alias dm='docker-machine'
fi

# History searching
function hist () {
  if [ -z "$TMUX" ]; then
    print -z $(ag --nofilename "$1" ~/.history | fzf +s --tac | cut -c 16-)
  else
    print -z $(ag --nofilename "$1" ~/.history | fzf-tmux -d 15 +s --tac | cut -c 16-)
  fi
}

# Neovim.app
alias nvimapp='open -a ~/Applications/Neovim.app'

# Git
alias glog='git log --oneline --decorate --all --graph'

# Docker
alias dockclean='docker rmi $(docker images -q -f dangling=true)'
alias dockpurge='docker rm $(docker ps -a -q)'

# RM Aliases
alias saferm='rm -i'
alias erase='sudo rm -v -r -P'

"[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

