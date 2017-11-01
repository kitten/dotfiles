if has('persistent_undo')
  if !isdirectory($HOME."/.cache/vim")
    call mkdir($HOME."/.cache/vim", "", 0770)
  endif

  if !isdirectory($HOME."/.cache/vim/undo")
    call mkdir($HOME."/.cache/vim/undo", "", 0770)
  endif

  set undodir=~/.cache/vim/undo
  set undofile
  set undolevels=1000
  set undoreload=10000
endif
