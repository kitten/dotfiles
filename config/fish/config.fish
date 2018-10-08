#####################################
# Env
#####################################

set -x GDK_SCALE 2
set -x LIBGL_ALWAYS_INDIRECT "true"
set -x DISPLAY "localhost:0.0"
set -x XDG_RUNTIME_DIR "/tmp"

# Determine environment
set -l unamestr (uname -s)
if test "$unamestr" = "Linux"
  set -x isOSX false
else
  set -x isOSX true
end

# Force nested shells to use xterm-256color-italic
set -x TERM 'tmux-256color'

# Ensure dotfiles bin directory is loaded first
if test $isOSX = true
  set -x PATH "$HOME/Library/Python/3.6/bin"
end

set -x PATH "$HOME/.bin" "$HOME/.npm-global/bin/" "/usr/local/sbin" "/usr/local/bin" "/usr/bin" "/bin" "/usr/sbin" "/sbin" $PATH
set -x PATH $PATH "./node_modules/.bin"

set -x PATH $PATH "/mnt/c/home/Development/emsdk" "/mnt/c/home/Development/emsdk/clang/e1.38.8_64bit" "/mnt/c/home/Development/emsdk/node/8.9.1_64bit/bin" "/mnt/c/home/Development/emsdk/emscripten/1.38.8"

# Adjut Yarn cache path
set -x YARN_CACHE_FOLDER "/home/phil/.cache/yarn"

# UID
set -x UID (id -u)

# Hostnames
set -x HOSTNAME (hostname)
if test $isOSX = true
  set -x HOSTNAME_SHORT (hostname -s)
else
  # There is no short hostname on Linux
  set -x HOSTNAME_SHORT (hostname)
end

# Current user
set -x DEFAULT_USER (whoami)

# Today's date
set -x DATE (date -u +%d.%m.%Y)
set -x YEAR (date -u +%Y)
set -x MONTH (date -u +%m)

# Current boottime
if test $isOSX = true
  set -x BOOTTIME (sysctl -n kern.boottime | awk -F"[ ,]+" '{print $4}')
else
  set -x BOOTTIME (date -d "(uptime -s)" +%s)
end

# Search for neovim, fallback to vim
if test (which nvim) != ""
  set -x VISUAL (which nvim)
else if test (which vim) != ""
  set -x VISUAL (which vim)
else
  set -x VISUAL "vim"
end

set -x EDITOR $VISUAL
set -x GNUPGHOME "/home/phil/gnupg"

if test -f "$HOME/.opam/opam-init/variables.fish"
  source "$HOME/.opam/opam-init/variables.fish"
end

if test -z "(pgrep gpg-agent)"
  gpgconf --launch gpg-agent
end

# Establish GPG Agent session
set -x GPG_AGENT_INFO "$GNUPGHOME/S.gpg-agent:(pgrep gpg-agent):1"
set -x GPG_TTY (tty)
set -x SSH_AUTH_SOCK "$GNUPGHOME/S.gpg-agent.ssh"
set -e SSH_AGENT_PID

######################################
# Fish
#####################################

# Remove default vi mode indicator
function fish_mode_prompt; end

# Remove fish greeting
function fish_greeting; end

# Enable vi mode
fish_vi_key_bindings

# Activate fzy in insert mode
bind -M insert \cr 'fzy_select_history (commandline -b)'

#####################################
# Alias
#####################################

alias l="k"
alias ack="ag"

alias nvim="$EDITOR"
alias vim="$EDITOR"
alias vi="$EDITOR"
alias edit="$EDITOR"

if test $isOSX = true
  alias less="/usr/local/share/nvim/runtime/macros/less.sh"
  alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
  alias joinpdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'
end

alias diff="$EDITOR -d"
alias vimdiff="$EDITOR -d"

# git
alias recommit='git commit -a --amend --no-edit'
alias pushf='git push --force-with-lease'
alias gst='git status'
alias glog='git log --oneline --decorate --all --graph'
alias git-today='git diff "HEAD@{yesterday}" HEAD --author="(git config user.email)" --stat'

alias myip='dig +short myip.opendns.com @resolver1.opendns.com'

alias saferm='rm -i'
alias erase='sudo rm -v -r -P'

# tmux
alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'

#####################################
# TMUX
#####################################

# Attach to tmux automatically
#if test "$TMUX" = ""
#  cd
#  tmux a
#  or tmux new-session -s casual
#end
