
set encoding=utf8
set list

" Invisibles
set listchars=tab:▸\ ,eol:¬

" Change cursor for iTerm
if exists('$ITERM_PROFILE')
  if exists('$TMUX')
    let &t_SI = "\<Esc>[3 q"
    let &t_EI = "\<Esc>[0 q"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
end

" Syntax highlighting
set nowrap
set textwidth=0
syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
colorscheme dracula

let g:airline_theme="solarized"

