# Ensure dotfiles bin directory is loaded first
export PATH="$HOME/.bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

# Determine environment
unamestr=`uname -s`
if [[ "$unamestr" == 'Linux' ]]; then
  export isOSX=false
else
  export isOSX=true
fi

# UID
export UID="$(id -u)"

# Hostnames
export HOSTNAME="$(hostname)"
export HOSTNAME_SHORT="$(hostname -s)"

# Today's date
export DATE="$(date -u +%d.%m.%Y)"
export YEAR="$(date -u +%Y)"
export MONTH="$(date -u +%m)"

# Current boottime
if [ "$isOSX" = true ]; then
  export BOOTTIME="$(sysctl -n kern.boottime | awk -F"[ ,]+" '{print $4}')"
else
  export BOOTTIME=`date -d "$(uptime -s)" +%s`
fi

# History
setopt HIST_IGNORE_SPACE
HISTDIR=$HOME/.history/$YEAR/$MONTH
[ -d $HISTDIR ] || mkdir -p $HISTDIR
HISTFILE="$HISTDIR/${BOOTTIME}_${HOSTNAME_SHORT}"

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

# nvm
export NVM_DIR=$(readlink "$HOME/.nvm")
source $NVM_DIR/nvm.sh

# SSH Agent
if [ "$isOSX" = true ]; then
  export SSH_AGENT_PID=$(pgrep -U $USER ssh-agent)
  if [ -n "$SSH_AGENT_PID" ]; then
    export SSH_AUTH_SOCK=$(lsof -U -a -p $SSH_AGENT_PID -F n | grep '^n/' | cut -c2-)
  fi
fi

# Local config
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local

