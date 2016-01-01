" Python paths
let g:python_host_prog  = "/usr/local/bin/python"

call plug#begin('~/.config/nvim/plugins')
  Plug 'tpope/vim-repeat'
  Plug 'editorconfig/editorconfig-vim'

  " Visual
  Plug 'airblade/vim-gitgutter'
  Plug 'bling/vim-airline'
  Plug 'myusuf3/numbers.vim'

  " Navigation
  Plug 'kien/ctrlp.vim'
  Plug 'FelikZ/ctrlp-py-matcher'
  Plug 'rking/ag.vim'
  Plug 'scrooloose/nerdtree'

  " Tools
  Plug 'tpope/vim-fugitive'
  Plug 'Valloric/ListToggle'
  Plug 'tpope/vim-eunuch'

  " Syntax
  Plug 'isRuslan/vim-es6'
  Plug 'ekalinin/Dockerfile.vim'
  Plug 'rust-lang/rust.vim'
  Plug 'haskell.vim'
  Plug 'keith/swift.vim'
  Plug 'fatih/vim-go'

  " Objects
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'tpope/vim-unimpaired'
  Plug 'MartinLafreniere/vim-PairTools'

  " Motions
  Plug 'terryma/vim-multiple-cursors'
  Plug 'Lokaltog/vim-easymotion'
  Plug 'tpope/vim-surround'
call plug#end()

set encoding=utf8
set list
set listchars=tab:▸\ ,eol:¬

nnoremap <Space> <nop>
let mapleader="\<Space>"

" Map comma to colon
noremap , :

" unmap F1 help
nmap <F1> <nop>
imap <F1> <nop>

" unmap arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Remove highlighting with Escape
nmap <silent> <Esc> :noh<CR>

" Syntax highlighting
syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
colorscheme Dracula

let g:airline#extensions#tmuxline#enabled = 0
let g:airline_theme="solarized"
highlight clear SignColumn
set cursorline

hi NonText guifg=#64666d guibg=NONE gui=NONE
hi SpecialKey guifg=#64666d guibg=NONE gui=NONE

" Ag Search
function! Agerium()
  let params = input('Search files for: ')
  execute 'Ag ' . params
endfunction
nnoremap <Leader>f :call Agerium()<CR>

" List Toggle
let g:lt_location_list_toggle_map = '<leader>p'
let g:lt_quickfix_list_toggle_map = '<leader>q'

" Easymotion Shortcuts
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)

" Gif config
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" Remap Arrow keys
map <Up> <Plug>(easymotion-k)
map <Down> <Plug>(easymotion-j)
map <Left> <Plug>(easymotion-linebackward)
map <Right> <Plug>(easymotion-lineforward)

" Gif config
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion

" Indentation
filetype plugin indent on
set autoindent
set ts=2
set shiftwidth=2
set expandtab

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
set nowb
set noswapfile

" Move to beginning/end of line
nnoremap <Leader>h ^
nnoremap <Leader>l $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" Line numbers
set number

" Powerline Font
let g:airline_powerline_fonts = 1

" Shortcuts
nnoremap <Leader>w :w<CR>

" ctrlp config
let g:ctrlp_map = '<leader>o'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_use_caching = 0
let g:ctrlp_max_height = 30
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0

" use silver searcher for ctrlp
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden -g ""'

" Speed up CtrlP
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Always use vertical diffs
set diffopt+=vertical

" Fugitive
let g:Gitv_OpenHorizontal = 1
let g:Gitv_WipeAllOnClose = 1
let g:Gitv_DoNotMapCtrlKey = 1

" Strip Trailing Whitespace on Save
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction
autocmd BufWritePre * :call TrimWhiteSpace()

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
