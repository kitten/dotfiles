function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.sh
  endif
endfunction

" Python paths
let g:python_host_prog  = "/usr/local/bin/python"

call plug#begin('~/.vim/plugged')
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-repeat'
  Plug 'editorconfig/editorconfig-vim'

  Plug 'floobits/floobits-neovim', { 'do': function('hooks#remote') }

  " Visual
  Plug 'frankier/neovim-colors-solarized-truecolor-only'
  Plug 'airblade/vim-gitgutter'
  Plug 'bling/vim-airline'
  Plug 'myusuf3/numbers.vim'

  " Navigation
  Plug 'kien/ctrlp.vim'
  Plug 'FelikZ/ctrlp-py-matcher'
  Plug 'rking/ag.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'jistr/vim-nerdtree-tabs'
  Plug 'terryma/vim-smooth-scroll'

  " Tools
  Plug 'MartinLafreniere/vim-PairTools'
  Plug 'tpope/vim-fugitive'
  Plug 'Valloric/ListToggle'
  Plug 'tpope/vim-eunuch'

  " Linting
  Plug 'benekastah/neomake'

  " Javascript Syntax
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'

  " Rust Syntax
  Plug 'rust-lang/rust.vim'

  " Haskell Syntax
  Plug 'haskell.vim'

  " Swift Syntax
  Plug 'keith/swift.vim'

  " Objects
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'tpope/vim-unimpaired'

  " Motions
  Plug 'terryma/vim-multiple-cursors'
  Plug 'Lokaltog/vim-easymotion'
  Plug 'tpope/vim-surround'

  " This has precendence to preserve C-[hjkl] shortcuts
  Plug 'christoomey/vim-tmux-navigator'
call plug#end()

set encoding=utf8
set nocompatible

nnoremap <Space> <nop>
let mapleader="\<Space>"

" Replace first character motion
nmap , ^

" Enter goes to next paragraph
nmap <CR> }

" unmap F1 help
nmap <F1> <nop>
imap <F1> <nop>

" Javascript
let g:used_javascript_libs = 'react,flux,requirejs'
let g:jsx_ext_required = 0

" Quit
nnoremap <Leader>x :qa<CR>

" Explorer List Style
let g:netrw_liststyle=3

" Git commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72

" NerdTREE Toggle
nnoremap <Leader>t :NERDTreeMirrorToggle<CR>

" NerdTREE config
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_smart_startup_focus = 2
let g:nerdtree_tabs_open_on_new_tab = 0
let g:nerdtree_tabs_focus_on_files = 1

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
colorscheme solarized

let g:airline#extensions#tmuxline#enabled = 0
let g:airline_theme="solarized"
highlight clear SignColumn
set cursorline

" Neomake Configuration
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_airline = 1
let g:neomake_error_sign = {
        \ 'text': '✗',
        \ 'texthl': 'DiffDelete',
        \ }

" Neomake Actuators
nnoremap <Leader>m :Neomake<CR>

" Force saving files that require root permission
cnoremap w!! w !sudo tee > /dev/null %

" Ag Search
nnoremap <Leader>f :Ag

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

" Smooth scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" Line numbers
set number

" Powerline Font
let g:airline_powerline_fonts = 1

" Shortcuts
nnoremap <Leader>w :w<CR>

" ctrlp config
let g:ctrlp_map = '<leader>o'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_use_caching = 0
let g:ctrlp_max_height = 30
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0

" use silver searcher for ctrlp
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'

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
