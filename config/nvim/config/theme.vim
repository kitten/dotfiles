set encoding=utf8
set list

" Invisibles
set listchars=tab:▸\ ,eol:⨼

" Enable true color support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

" Enable cursor shape switching
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Syntax highlighting
set nowrap
set textwidth=0
syntax enable
set background=dark
colorscheme sharkbites

let g:airline_theme="sharkbites"

" Sharkbites mods
hi NonText guifg=#404449 guibg=NONE gui=NONE
hi SpecialKey guifg=#404449 guibg=NONE gui=NONE
hi VertSplit guifg=#555555 guibg=#555555 gui=NONE
hi Normal guifg=#f8f8f2 guibg=NONE gui=NONE

" Some theming for ALE
hi ALEWarningSign ctermfg=70 ctermbg=NONE cterm=NONE guifg=#4BAE16 guibg=NONE gui=NONE
hi ALEErrorSign ctermfg=166 ctermbg=NONE cterm=NONE guifg=#D3422E guibg=NONE gui=NONE

