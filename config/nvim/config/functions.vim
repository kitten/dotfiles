" Ag Search
function! Agerium()
  let params = input('Search files for: ')
  execute 'Ag ' . params
endfunction

" Strip Trailing Whitespace on Save
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction
autocmd BufWritePre * :call TrimWhiteSpace()

