" Onivim Init
set nocompatible
filetype off

" Encoding & Line Endings
set encoding=utf8
set ffs=dos,unix

" Indentation
filetype plugin indent on
set ts=2
set shiftwidth=2
set expandtab

" Remove maxwidth
set textwidth=0

" No wrapping
set nowrap

" Make backspace usable
set backspace=indent,eol,start

" Searching
set ignorecase
set hlsearch
set incsearch
set smartcase

" Scrolling offset
set scrolloff=2

" No code folding
set nofoldenable

" No Backups
set nobackup
set nowb
set noswapfile

" Line numbers
set number

" Split behaviour
set splitbelow
set splitright

" Vertical diffs
set diffopt+=vertical

" Disable welcome message
set shortmess+=I

if has('nvim')
  set inccommand=nosplit
endif

" Turn off statusbar, because it is externalized
set noshowmode
set noruler
set laststatus=0
set statusline=""
set noshowcmd

" Enable GUI mouse behavior
set mouse=a

" True Colour FTW
set termguicolors
