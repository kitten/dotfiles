" Neomake
autocmd! BufWritePost * Neomake

function! neomake#makers#ft#typescript#tsc()
    return {
        \ 'args': [
            \ '--project', getcwd(), '--noEmit'
        \ ],
        \ 'append_file': 0,
        \ 'errorformat':
            \ '%E%f %#(%l\,%c): error %m,' .
            \ '%E%f %#(%l\,%c): %m,' .
            \ '%Eerror %m,' .
            \ '%C%\s%\+%m'
        \ }
endfunction

let g:neomake_error_sign = {
  \ 'text': '●',
  \ 'texthl': 'GitGutterDeleteDefault',
  \ }
let g:neomake_warning_sign = {
  \ 'text': '●',
  \ 'texthl': 'GitGutterChangeDefault',
  \ }
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_typescript_enabled_makers = ['tsc', 'tslint']

