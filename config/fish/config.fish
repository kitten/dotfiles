#####################################
# Env
#####################################

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
  # set -x PATH "$HOME/Library/Python/3.6/bin"
end

set -x PATH "$HOME/.bin" "/usr/local/sbin" "/usr/local/bin" "/usr/bin" "/bin" "/usr/sbin" "/sbin" $PATH
set -x PATH $PATH "$HOME/.cargo/bin"
set -x PATH $PATH "./node_modules/.bin"

# Adjut Yarn cache path
set -x YARN_CACHE_FOLDER "$HOME/.cache/yarn"

# GitHub NPM Auth
set -x GITHUB_NPM_AUTH_TOKEN "14a0ed64f7e09b42a326ddcbe2f5ad5a0a073eaa"

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
set -x GNUPGHOME "$HOME/.gnupg"

if test -f "$HOME/.opam/opam-init/variables.fish"
  source "$HOME/.opam/opam-init/variables.fish"
end

if test $isOSX = true
  if test -z "(pgrep gpg-agent)"
    gpgconf --launch gpg-agent
  end

  set -x GPG_AGENT_INFO "$HOME/.gnupg/S.gpg-agent"
  set -x SSH_AUTH_SOCK "$HOME/.gnupg/S.gpg-agent.ssh"
else
  set -x GPG_AGENT_INFO "$XDG_RUNTIME_DIR/gnupg/S.gpg-agent"
  set -x SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/gnupg/S.gpg-agent.ssh"
end

set -x GPG_TTY (tty)
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

set -g fish_user_paths "/usr/local/opt/cheerp" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/ruby/bin" $fish_user_paths

starship init fish | source

#####################################
# TMUX
#####################################

# Attach to tmux automatically
#if test "$TMUX" = ""
#  cd
#  tmux a
#  or tmux new-session -s casual
#end
