" Set leader
let mapleader="\<Space>"

" Unmap F1 Help
nmap <F1> <nop>
imap <F1> <nop>

" Map semicolon to space
noremap ; :

" Blackhole x operator
nnoremap X "_d
nnoremap XX "_dd
vnoremap X "_d
vnoremap x "_d
nnoremap x "_x

" Fix dot operator to work the same in visual mode
vnoremap . :norm.<CR>

" Allows you to visually select a section and then hit @ to run a macro on all lines
" https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db#.3dcn9pr
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

" Preserve selection after indenting
vnoremap > >gv
vnoremap < <gv

" Make Ctrl+c behave exactly like Escape
inoremap <c-c> <ESC>

" Use ESC to exit insert mode in :term
tnoremap <Esc> <C-\><C-n>

nnoremap <silent> <leader>o :call OniCommand('quickOpen.show')<CR>

" unmap arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Remap Arrow keys
map <Up> <Plug>(easymotion-k)
map <Down> <Plug>(easymotion-j)
map <Left> <Plug>(easymotion-linebackward)
map <Right> <Plug>(easymotion-lineforward)

" <Tab> for Autocompletion
"inoremap <silent> <tab> <C-o>:call OniCommand('contextMenu.select')<CR>
