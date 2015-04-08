"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif
  set runtimepath+=/Users/phil/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'tpope/vim-sensible'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'michaeljsmith/vim-indent-object'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'rking/ag.vim'
NeoBundle 'myusuf3/numbers.vim'
NeoBundle 'MartinLafreniere/vim-PairTools'
NeoBundle 'benekastah/neomake'
NeoBundle 'bling/vim-airline'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'terryma/vim-smooth-scroll'
NeoBundle 'Valloric/ListToggle'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'marijnh/tern_for_vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'zhaocai/GoldenView.Vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jistr/vim-nerdtree-tabs'

" This has precendence to preserve C-[hjkl] shortcuts
NeoBundle 'christoomey/vim-tmux-navigator'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck
"End NeoBundle Scripts-------------------------

set encoding=utf8
set clipboard=unnamed
set t_Co=256

let mapleader = " "

" Disable leader timeout
set notimeout
set ttimeout

" Replace first character motion
nmap , ^

" Enter goes to next paragraph
nmap <CR> }

" unmap F1 help
nmap <F1> <nop>
imap <F1> <nop>

" Quit
nnoremap <Leader>x :qa<CR>

" Git commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72

" NerdTREE Toggle
nnoremap <Leader>t :NERDTreeMirrorToggle<CR>

" unmap arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Remove highlighting with Escape
nmap <Esc> :noh<CR>

" Cursor shape
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" Syntax highlighting
syntax enable

" Theming
set background=dark
let g:solarized_termtrans=1
colorscheme solarized
set cursorline
let g:airline#extensions#tmuxline#enabled = 0
let g:airline_theme="solarized"
highlight clear SignColumn

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
autocmd! BufWritePost * Neomake

" Ag Search
nnoremap <Leader>f :Ag

" List Toggle
let g:lt_location_list_toggle_map = '<leader>p'
let g:lt_quickfix_list_toggle_map = '<leader>q'

" Easymotion Shortcuts
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)

" Gif config
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
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
if version >= 700
  au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
  au InsertLeave * hi StatusLine ctermbg=240 ctermfg=12
endif

" Highlight trailing spaces
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" Scrolling
set scrolloff=2

" No code folding
set nofoldenable

" No Backup
set nobackup
set nowb
set noswapfile

" Smooth scroll
noremap <silent> <c-y> :call smooth_scroll#up(4, 20, 1)<CR>
noremap <silent> <c-e> :call smooth_scroll#down(4, 20, 1)<CR>
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 30, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 30, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 30, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 30, 4)<CR>

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
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

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
