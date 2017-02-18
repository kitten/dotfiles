# Force nested shells to use xterm-256color-it
export TERM="xterm-256color-it"

# Ensure dotfiles bin directory is loaded first
export PATH="$HOME/.bin:$HOME/.n/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH:./node_modules/.bin"

# ZPlug Env Variables
export DISABLE_AUTO_UPDATE=true # Eliminate omz auto updates
export ZPLUG_PROTOCOL="SSH"
export ZPLUG_HOME="$HOME/.zplug"
export ZPLUG_CACHE="$HOME/.cache/zplug"
export ZPLUG_CACHE_DIR="$ZPLUG_CACHE/cache"
export ZPLUG_REPOS="$ZPLUG_CACHE/repos"
[ -d $ZPLUG_CACHE_DIR ] || mkdir -p $ZPLUG_CACHE_DIR
[ -d $ZPLUG_REPOS ] || mkdir -p $ZPLUG_REPOS

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
if [ "$isOSX" = true ]; then
  export HOSTNAME_SHORT="$(hostname -s)"
else
  # There is no short hostname on linux
  export HOSTNAME_SHORT="$(hostname)"
fi

# Current user
export DEFAULT_USER=$(whoami)

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

# Start up GPG Agent or source env from running one
if [ -f "${HOME}/.gpg-agent-info" ] && [ -n "$(pgrep gpg-agent)" ]; then
  source "${HOME}/.gpg-agent-info"
  export GPG_AGENT_INFO
  export SSH_AUTH_SOCK
  export SSH_AGENT_PID
else
  if [ -f "${HOME}/.gpg-agent-info" ]; then rm "${HOME}/.gpg-agent-info"; fi
  if [ -n "$(pgrep gpg-agent)" ]; then pkill gpg-agent; fi

  eval $(gpg-agent --daemon --log-file ~/.gnupg/gpg-agent.log)
fi

# Apparently we need this for GPG
export GPG_TTY=$(tty)

# Local config
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local

