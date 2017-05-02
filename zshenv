# Force nested shells to use xterm-256color-italic
export TERM="xterm-256color-italic"

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
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
HISTSIZE=10000000
SAVEHIST=10000000
HISTDIR=$HOME/.history/$YEAR/$MONTH
[ -d $HISTDIR ] || mkdir -p $HISTDIR
HISTFILE="$HISTDIR/${BOOTTIME}_${HOSTNAME_SHORT}"
touch $HISTFILE

# Search for neovim, fallback to vim
if which nvim >/dev/null; then
  export VISUAL="$(which nvim)"
elif which vim >/dev/null; then
  export VISUAL="$(which vim)"
else
  export VISUAL="vim"
fi

export EDITOR=$VISUAL

# Establish GPG Agent session
export GPG_TTY=$(tty)
gpg-connect-agent --quiet /bye
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

# Local config
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local

