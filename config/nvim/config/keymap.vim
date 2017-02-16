" Set leader to space
let mapleader=" "
nnoremap <Space> <nop>

" unmap F1 help
nmap <F1> <nop>
imap <F1> <nop>

" Map semicolon to colon
noremap ; :

" Quick/Location list Toggle
let g:lt_location_list_toggle_map = '<leader>p'
let g:lt_quickfix_list_toggle_map = '<leader>q'

" fzf
nnoremap <Leader>o :GFiles<CR>

" Agerium
nnoremap <Leader>f :call Agerium()<CR>

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

" Move to previous/next buffer
nnoremap <leader>h :bprevious<CR>
nnoremap <leader>l :bnext<CR>

" Go to last used buffer
nnoremap <leader>j C-^

" Close a buffer
nnoremap <leader>k :bp <BAR> bd #<CR>

" List buffers
nnoremap <leader>b :Buffers<CR>

" List buffer commits
nnoremap <leader>c :BCommits<CR>

" List git status files
nnoremap <leader>c :GFiles?<CR>

" Blackhole all x commands and make X behave like d
nnoremap X "_d
nnoremap XX "_dd
vnoremap X "_d
vnoremap x "_d
nnoremap x "_x

" Make the dot command work as expected in visual mode (via
" https://www.reddit.com/r/vim/comments/3y2mgt/do_you_have_any_minor_customizationsmappings_that/cya0x04)
vnoremap . :norm.<CR>

" Allows you to visually select a section and then hit @ to run a macro on all lines
" https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db#.3dcn9prw6
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

" Have the indent commands re-highlight the last visual selection to make
" multiple indentations easier
vnoremap > >gv
vnoremap < <gv

" TypeScript specific keymaps
autocmd FileType typescript nmap <Leader>d :TsuDefinition<CR>
autocmd FileType typescript nmap <Leader>r :TsuReferences<CR>
autocmd FileType typescript nmap <Leader>i :TsuImport<CR>
autocmd FileType typescript nmap <Leader>t :call TsuSearchPrompt()<CR>
autocmd FileType typescript nmap <buffer> <Leader>e <Plug>(TsuquyomiRenameSymbol)
autocmd FileType typescript nmap <buffer> <Leader>E <Plug>(TsuquyomiRenameSymbolC)
autocmd FileType typescript nmap <buffer> <Leader>p : <C-u>echo tsuquyomi#hint()<CR>

