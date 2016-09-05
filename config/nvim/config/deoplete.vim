let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete = 1

" Use smartcase.
let g:deoplete#enable_smart_case = 1

" Close scratch window automatically
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

