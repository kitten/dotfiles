let g:plug_timeout = 300

call plug#begin('~/.config/nvim/plugins')
  Plug 'tpope/vim-repeat'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'Shougo/vimproc.vim', { 'do': 'make' }
  Plug 'simnalamburt/vim-mundo'
  Plug 'jsfaint/purge_undodir.vim'
  Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
  Plug 'roxma/python-support.nvim'

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
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'justinmk/vim-dirvish'

  " Tools
  Plug 'tpope/vim-fugitive'
  Plug 'Valloric/ListToggle'

  " Syntax
  Plug 'sheerun/vim-polyglot', { 'do': 'npm i -g javascript-typescript-langserver flow-language-server' }
  Plug 'reasonml-editor/vim-reason-plus', { 'do': 'npm i -g ocaml-language-server' }
  Plug 'jparise/vim-graphql', { 'do': 'npm i -g graphql-language-service' }

  " Motions
  Plug 'Lokaltog/vim-easymotion'
  Plug 'tpope/vim-surround'
  Plug 'bronson/vim-visual-star-search'

  " Linting
  Plug 'w0rp/ale'
  Plug 'Shougo/echodoc.vim'

  " Completion
  Plug 'ncm2/ncm2'
  Plug 'roxma/nvim-yarp'
  Plug 'ncm2/ncm2-tmux'
  Plug 'ncm2/ncm2-bufword'
  Plug 'ncm2/ncm2-path'
  Plug 'ncm2/ncm2-cssomni'

  " Non neovim dependencies
  if !has('nvim')
    Plug 'roxma/vim-hug-neovim-rpc'
  endif
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
