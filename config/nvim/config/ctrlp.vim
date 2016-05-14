" ctrlp config
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_use_caching = 0
let g:ctrlp_max_height = 30
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_lazy_update = 350
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_files = 0

" use silver searcher for ctrlp
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden -g ""'
endif

" Speed up CtrlP
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

