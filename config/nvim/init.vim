let g:plug_timeout = 300

call plug#begin('~/.config/nvim/plugins')
  Plug 'tpope/vim-repeat'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'simnalamburt/vim-mundo'
  Plug 'jsfaint/purge_undodir.vim'

  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Themes
  Plug 'drewtempelmeyer/palenight.vim'

  " Visual
  Plug 'airblade/vim-gitgutter'
  Plug 'itchyny/lightline.vim'
  Plug 'sjl/vitality.vim'
  Plug 'sts10/vim-zipper'
  Plug 'roman/golden-ratio'
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'

  " Navigation
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'justinmk/vim-dirvish'

  " Tools
  Plug 'tpope/vim-fugitive'
  Plug 'Valloric/ListToggle'

  " Syntax
  Plug 'sheerun/vim-polyglot'

  " Motions
  Plug 'Lokaltog/vim-easymotion'
  Plug 'tpope/vim-surround'
  Plug 'bronson/vim-visual-star-search'
call plug#end()

let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

" Import all .vim files in config
for f in split(glob('~/.config/nvim/config/*.vim'), '\n')
  exe 'source' f
endfor

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
