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

# Docker & Boot2Docker
alias dockup='boot2docker up && eval "$(boot2docker shellinit)"'
alias dockdo='boot2docker stop'
alias dockop='open http://$(boot2docker ip 2>/dev/null)/'

# Neovim.app
alias nvimapp='open -a /Applications/Neovim.app'

# z.sh
. ~/.zjump/z.sh

