" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~30%' }

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
"
" Ag Search
function! Agerium()
  let params = input('Search files for: ')
  execute 'Ag ' . params
endfunction

