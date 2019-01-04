" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'reason': ['ocaml-language-server', '--stdio'],
    \ 'ocaml': ['ocaml-language-server', '--stdio'],
    \ 'javascript': ['flow-language-server', '--try-flow-bin', '--stdio'],
    \ 'javascript.jsx': ['flow-language-server', '--try-flow-bin', '--stdio'],
    \ 'typescript': ['javascript-typescript-stdio']
    \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1
