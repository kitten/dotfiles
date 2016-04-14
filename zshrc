source $HOME/.zshenv

# PLUGS #############################################
source ~/.zplug/zplug

zplug "tj/n", do:"make install"

zplug "zsh-users/zsh-history-substring-search"
zplug "rupa/z", of:"z.sh"

zplug "plugins/git", from:oh-my-zsh, if:"which git"
zplug "plugins/tmux", from:oh-my-zsh, if:"which tmux"
zplug "plugins/osx", from:oh-my-zsh, if:"[ $isOSX = true ]"

zplug "themes/sorin", from:oh-my-zsh
zplug load
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
alias myip='curl ipv4.wtfismyip.com/text'

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
  function dmdns() {
    DOCKERMACHINEIP=$(docker-machine ip $DOCKER_MACHINE_NAME)
    if [ -z "$1" ]; then
      DOCKER_TEMP_NAME=$DOCKER_MACHINE_NAME
    else
      DOCKER_TEMP_NAME=$1
    fi

    if [ ! -e /etc/resolver/$DOCKER_TEMP_NAME ]; then
      echo "Adding forwarder from $DOCKER_TEMP_NAME TLD to dnsmasq"
      sudo mkdir -p /etc/resolver
      sudo echo "nameserver 127.0.0.1" > /etc/resolver/$DOCKER_TEMP_NAME
    fi

    sed -i '' "/^address=\/.$DOCKER_TEMP_NAME\//d" /usr/local/etc/dnsmasq.conf
    echo "address=/.$DOCKER_TEMP_NAME/$DOCKERMACHINEIP" >> /usr/local/etc/dnsmasq.conf
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

# z.sh
#. ~/.zjump/z.sh

# IRC
alias freenode='irssi -c irc.freenode.net -p 8001 -n vielviel_phil'

# Docker
alias dockclean='docker rmi $(docker images -q -f dangling=true)'
alias dockpurge='docker rm $(docker ps -a -q)'
