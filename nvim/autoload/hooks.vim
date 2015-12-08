function! hooks#remote(info)
  if a:info.status == 'installed' || a:info.status == 'updated' || a:info.force
    UpdateRemotePlugins
    echom "Remember to restart!"
  endif
endfunction
