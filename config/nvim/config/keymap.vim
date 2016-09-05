" Set leader to space
let mapleader=" "
nnoremap <Space> <nop>

" unmap F1 help
nmap <F1> <nop>
imap <F1> <nop>

" Map comma to colon
noremap , :

" Quick/Location list Toggle
let g:lt_location_list_toggle_map = '<leader>p'
let g:lt_quickfix_list_toggle_map = '<leader>q'

" fzf
nnoremap <Leader>o :GFiles<CR>

" Agerium
nnoremap <Leader>f :call Agerium()<CR>

" NERDTree
nnoremap <Leader>n :NERDTreeTabsToggle<CR>

" Easymotion Shortcuts
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)

" Gif config
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

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

" Gif config
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

" Move to beginning/end of line
nnoremap <Leader>h ^
nnoremap <Leader>l $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" Save
nnoremap <Leader>w :w<CR>

