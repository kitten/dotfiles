" Neomake
autocmd! BufWritePost * Neomake

let g:neomake_error_sign = {
  \ 'text': '●',
  \ 'texthl': 'DiffDelete',
  \ }
let g:neomake_warning_sign = {
  \ 'text': '●',
  \ 'texthl': 'DiffChange',
  \ }
let g:neomake_javascript_enabled_makers = ['eslint']

