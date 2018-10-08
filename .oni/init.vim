set shell=C:\\Windows\\System32\\bash.exe
set shellcmdflag=-ic
set shellslash

let g:python3_host_prog='C:/Python36/python.exe'
let g:python_host_prog='C:/Python27/python.exe'
let g:ruby_host_prog='C:/tools/ruby25/bin/ruby.exe'
let g:node_host_prog='C:/Program Files/nodejs/node.exe'

for f in split(glob('C:\Users\Phil Pluckthun\.config\oni\config\*.vim'), '\n')
  exe 'source' f
endfor

au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.mdx set filetype=markdown
