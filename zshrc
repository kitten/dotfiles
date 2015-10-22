source $HOME/.zshenv

ZSH_THEME="edvardm"
DISABLE_AUTO_UPDATE="true"
HIST_STAMPS="dd.mm.yyyy"
plugins=(battery tmux git brew npm)

# Load Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

alias ack="ag"

# Just use one editor
alias nvim="$EDITOR"
alias vim="$EDITOR"
alias vi="$EDITOR"
alias edit="$EDITOR"

alias recommit='git commit -a --amend --no-edit'

alias joinpdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

# Disable auto-correct
unsetopt correct_all

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# The Fuck
alias fuck='$(thefuck $(fc -ln -1))'

# My IP
alias myip='curl ipv4.wtfismyip.com/text'

# Docker
function dmenv () {
  eval "$(docker-machine env $1)"
}
function dmopen () {
  open "http://$(docker-machine ip $1)"
}
function dmip () {
  docker-machine ip $DOCKER_MACHINE_NAME
}
alias dm='docker-machine'

# Neovim.app
alias nvimapp='open -a ~/Applications/Neovim.app'

# z.sh
. ~/.zjump/z.sh

# IRC
alias freenode='irssi -c irc.freenode.net -p 8001 -n vielviel_phil'

# Docker
alias dockclean='docker rmi $(docker images -q -f dangling=true)'
alias dockpurge='docker rm $(docker ps -a -q)'

