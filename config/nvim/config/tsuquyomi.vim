let g:tsuquyomi_disable_default_mappings = 1

" Keyword Search
function! TsuSearchPrompt()
  let params = input('Search files for keyword: ')
  execute 'TsuSearch ' . params
endfunction

let g:tsuquyomi_disable_quickfix = 1

