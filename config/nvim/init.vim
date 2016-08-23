call plug#begin('~/.config/nvim/plugins')
  Plug 'tpope/vim-repeat'
  Plug 'editorconfig/editorconfig-vim'

  " Visual
  Plug 'airblade/vim-gitgutter'
  Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
  Plug 'sjl/vitality.vim'

  " Navigation
  Plug 'kien/ctrlp.vim'
  Plug 'FelikZ/ctrlp-py-matcher'
  Plug 'rking/ag.vim'
  Plug 'scrooloose/nerdtree' | Plug 'jistr/vim-nerdtree-tabs'

  " Tools
  Plug 'tpope/vim-fugitive'
  Plug 'Valloric/ListToggle'
  Plug 'tpope/vim-eunuch'

  " Syntax
  Plug 'kern/vim-es7'
  Plug 'othree/es.next.syntax.vim'
  Plug 'ekalinin/Dockerfile.vim'
  Plug 'rust-lang/rust.vim'
  Plug 'haskell.vim'
  Plug 'keith/swift.vim'
  "Plug 'fatih/vim-go'
  Plug 'Harenome/vim-mipssyntax'
  Plug 'elixir-lang/vim-elixir'
  Plug 'maksimr/vim-jsbeautify'
  Plug 'rhysd/vim-crystal'

  " Objects
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'tpope/vim-unimpaired'

  " Motions
  Plug 'terryma/vim-multiple-cursors'
  Plug 'Lokaltog/vim-easymotion'
  Plug 'tpope/vim-surround'

  " Completion
  Plug 'Shougo/deoplete.nvim'
  Plug 'neomake/neomake'
call plug#end()

" Activate JSX for JS files
let g:jsx_ext_required = 0

source ~/.config/nvim/config/basic.vim
source ~/.config/nvim/config/functions.vim
source ~/.config/nvim/config/theme.vim
source ~/.config/nvim/config/nerdtree.vim
source ~/.config/nvim/config/deoplete.vim
source ~/.config/nvim/config/airline.vim
source ~/.config/nvim/config/neomake.vim
source ~/.config/nvim/config/fugitive.vim
source ~/.config/nvim/config/easymotion.vim
source ~/.config/nvim/config/ctrlp.vim
source ~/.config/nvim/config/vitality.vim
source ~/.config/nvim/config/keymap.vim

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif


