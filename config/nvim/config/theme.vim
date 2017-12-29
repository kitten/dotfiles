set encoding=utf8
set list

" Invisibles
set listchars=tab:▸\ ,eol:⨼

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

" Palenight Italics
let g:palenight_terminal_italics=1

" Syntax highlighting
set nowrap
set textwidth=0
syntax enable
set background=dark
colorscheme palenight

" Translucent background
hi LineNr guifg=#404449 guibg=NONE gui=NONE
hi NonText guifg=#404449 guibg=NONE gui=NONE
hi SpecialKey guifg=#404449 guibg=NONE gui=NONE
hi VertSplit guifg=#555555 guibg=#555555 gui=NONE
hi Normal guifg=#f8f8f2 guibg=NONE gui=NONE

" Some theming for ALE
hi ALEWarningSign ctermfg=70 ctermbg=NONE cterm=NONE guifg=#4BAE16 guibg=NONE gui=NONE
hi ALEErrorSign ctermfg=166 ctermbg=NONE cterm=NONE guifg=#D3422E guibg=NONE gui=NONE

