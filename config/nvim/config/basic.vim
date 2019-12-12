" Set default shell
set shell=/bin/bash

set hidden

" Encoding
set encoding=utf8

" Indentation
filetype plugin indent off
set autoindent
set nosmartindent
set ts=2
set shiftwidth=2
set expandtab

" Max Width
set textwidth=0

" Lazy redraw for e.g. macros
set lazyredraw

" Lower default updatetime
set updatetime=300

" No wrapping except onmarkdown and html
set nowrap
autocmd FileType markdown setlocal wrap
autocmd FileType html setlocal wrap

" Make backspace usable
set backspace=indent,eol,start

" Show matching brackets
set showmatch

" Searching
set ignorecase
set hlsearch
set incsearch

" Smartcaps
set smartcase

" Statusbar
set ruler
set laststatus=2
set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]

" Scrolling
set scrolloff=2

" No code folding
set nofoldenable

" No Backup
set nobackup
set nowritebackup
set nowb
set noswapfile

" Line numbers
set number

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Always use vertical diffs
set diffopt+=vertical

" Italics support
set t_ZH=^[[3m
set t_ZR=^[[23m

set shortmess+=I
set shortmess+=c

" Command livepreview for nvim
if has('nvim')
  set inccommand=nosplit
endif
