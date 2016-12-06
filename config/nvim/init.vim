call plug#begin('~/.config/nvim/plugins')
  Plug 'tpope/vim-repeat'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'Shougo/vimproc.vim', { 'do': 'make' }

  " Visual
  Plug 'philpl/vim-adventurous'
  Plug 'airblade/vim-gitgutter'
  Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
  Plug 'sjl/vitality.vim'
  Plug 'sts10/vim-zipper'

  " Navigation
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'scrooloose/nerdtree' | Plug 'jistr/vim-nerdtree-tabs'
  Plug 'majutsushi/tagbar'

  " Tools
  Plug 'tpope/vim-fugitive'
  Plug 'Valloric/ListToggle'
  Plug 'tpope/vim-eunuch'

  " Syntax
  Plug 'othree/yajs.vim'
  Plug 'othree/es.next.syntax.vim'
  Plug 'ekalinin/Dockerfile.vim'
  Plug 'haskell.vim', { 'for': 'haskell' }
  Plug 'elixir-lang/vim-elixir'
  Plug 'rhysd/vim-crystal'
  Plug 'keith/swift.vim'
  Plug 'leafgarland/typescript-vim'
  Plug 'Quramy/vim-js-pretty-template'
  Plug 'jason0x43/vim-js-indent'

  " Motions
  Plug 'matze/vim-move'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'Lokaltog/vim-easymotion'
  Plug 'tpope/vim-surround'
  Plug 'bronson/vim-visual-star-search'

  " Completion
  Plug 'ervandew/supertab'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'carlitux/deoplete-ternjs', { 'do': 'npm i -g tern', 'for': 'javascript' }
  Plug 'mhartington/deoplete-typescript', { 'do': 'npm i -g typescript', 'for': 'typescript' }
  Plug 'neomake/neomake'
  Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }
call plug#end()

" Activate JSX for JS files
let g:jsx_ext_required = 0

source ~/.config/nvim/config/basic.vim
source ~/.config/nvim/config/fold.vim
source ~/.config/nvim/config/functions.vim
source ~/.config/nvim/config/theme.vim
source ~/.config/nvim/config/nerdtree.vim
source ~/.config/nvim/config/tagbar.vim
source ~/.config/nvim/config/supertab.vim
source ~/.config/nvim/config/deoplete.vim
source ~/.config/nvim/config/airline.vim
source ~/.config/nvim/config/neomake.vim
source ~/.config/nvim/config/tsuquyomi.vim
source ~/.config/nvim/config/fugitive.vim
source ~/.config/nvim/config/easymotion.vim
source ~/.config/nvim/config/move.vim
source ~/.config/nvim/config/fzf.vim
source ~/.config/nvim/config/vitality.vim
source ~/.config/nvim/config/keymap.vim

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif


