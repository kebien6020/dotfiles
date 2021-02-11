if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden -lg ""'
endif
noremap <silent> <C-p> :Files<CR>
