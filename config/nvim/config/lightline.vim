" Disable insert message for lightline
set noshowmode

let g:lightline = {
  \ 'colorscheme': 'one',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'readonly', 'filename' ] ],
  \ },
  \ 'component_function': {
  \   'filename': 'LightlineFilename',
  \ },
  \ }


function! LightlineFilename()
  let filename = @% !=# '' ? @% : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction
