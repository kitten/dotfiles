call plug#begin('~/.config/nvim/plugins')
  Plug 'tpope/vim-repeat'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'Shougo/vimproc.vim', { 'do': 'make' }

  " Visual
  Plug 'philpl/vim-adventurous'
  Plug 'kenwheeler/glow-in-the-dark-gucci-shark-bites-vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
  Plug 'sjl/vitality.vim'
  Plug 'sts10/vim-zipper'
  Plug 'roman/golden-ratio'

  " Navigation
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'justinmk/vim-dirvish'

  " Tools
  Plug 'tpope/vim-fugitive'
  Plug 'Valloric/ListToggle'

  " JS Syntax
  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'mxw/vim-jsx'
  Plug 'ianks/vim-tsx'

  " TypeScript
  Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }

  " Syntax
  Plug 'ekalinin/Dockerfile.vim'
  Plug 'haskell.vim', { 'for': 'haskell' }
  Plug 'elixir-lang/vim-elixir'
  Plug 'rhysd/vim-crystal'
  Plug 'keith/swift.vim'
  Plug 'ElmCast/elm-vim', { 'for': 'elm' }

  " Motions
  Plug 'Lokaltog/vim-easymotion'
  Plug 'tpope/vim-surround'
  Plug 'bronson/vim-visual-star-search'

  " Linting
  Plug 'w0rp/ale'

  " Completion
  Plug 'ervandew/supertab'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'carlitux/deoplete-ternjs', { 'do': 'npm i -g tern', 'for': 'javascript' }

call plug#end()

let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

" Disable keybindings for elm-vim
let g:elm_setup_keybindings = 0

" Import all .vim files in config
for f in split(glob('~/.config/nvim/config/*.vim'), '\n')
  exe 'source' f
endfor

autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
autocmd BufNewFile,BufRead *.elm set filetype=elm

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif


