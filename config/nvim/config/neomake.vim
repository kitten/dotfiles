" Neomake
autocmd! BufWritePost * Neomake

let g:neomake_error_sign = {
  \ 'text': '●',
  \ 'texthl': 'GitGutterDeleteDefault',
  \ }
let g:neomake_warning_sign = {
  \ 'text': '●',
  \ 'texthl': 'GitGutterChangeDefault',
  \ }
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_typescript_enabled_makers = []

