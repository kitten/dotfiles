set completeopt-=preview

let g:deoplete#auto_complete_delay=50 " Fix auto-insert bug
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#auto_complete_start_length = 2
let g:auto_complete_start_length = 2
let g:deoplete#enable_refresh_always = 1

" Use smartcase.
let g:deoplete#enable_smart_case = 1

" Close scratch window automatically
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Missing tsx extension
autocmd BufNewFile,BufRead *.ts,*.tsx setlocal filetype=typescript

