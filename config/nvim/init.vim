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

  " JS Syntax
  Plug 'othree/yajs.vim'
  Plug 'othree/es.next.syntax.vim'
  Plug 'leafgarland/typescript-vim'
  Plug 'Quramy/vim-js-pretty-template'
  Plug 'jason0x43/vim-js-indent'
  Plug 'mxw/vim-jsx'
  Plug 'ianks/vim-tsx'

  " Syntax
  Plug 'ekalinin/Dockerfile.vim'
  Plug 'haskell.vim', { 'for': 'haskell' }
  Plug 'elixir-lang/vim-elixir'
  Plug 'rhysd/vim-crystal'
  Plug 'keith/swift.vim'

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

" Import all .vim files in config
for f in split(glob('~/.config/nvim/config/*.vim'), '\n')
  exe 'source' f
endfor

autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif


