" Enable true color support
if (has("nvim"))
  " For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
  set termguicolors
endif

" Enable cursor shape switching
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

function! ResetTheme()
  " Don't reset background colour
  let &t_ut=''

  " Invisibles
  set listchars=tab:▸\ ,eol:⨼,trail:·
  set list

  " Palenight Italics
  let g:palenight_terminal_italics=1

  " Syntax highlighting
  syntax enable
  set background=dark
  set cursorline
  colorscheme palenight

  " Translucent background
  hi LineNr guifg=#404449 guibg=NONE gui=NONE
  hi CursorLine ctermbg=232 guibg=#16181c
  hi CursorLineNR ctermfg=180 ctermbg=232 cterm=bold guifg=#ffcb6b guibg=#16181c gui=bold
  hi NonText guifg=#404449 guibg=NONE gui=NONE
  hi SpecialKey guifg=#404449 guibg=NONE gui=NONE
  hi VertSplit ctermfg=235 ctermbg=235 cterm=NONE guifg=#282c34 guibg=#282c34 gui=NONE
  hi Normal guifg=#f8f8f2 guibg=NONE gui=NONE

  " Some theming for ALE
  hi ALEWarningSign ctermfg=70 ctermbg=NONE cterm=NONE guifg=#4BAE16 guibg=NONE gui=NONE
  hi ALEErrorSign ctermfg=166 ctermbg=NONE cterm=NONE guifg=#D3422E guibg=NONE gui=NONE
endfunction

call ResetTheme()
