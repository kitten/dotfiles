set completeopt=noinsert,menuone,noselect
set shortmess+=c

autocmd BufEnter * call ncm2#enable_for_buffer()

" Hide and start a newline on <cr>
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <tab> for completion window
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
