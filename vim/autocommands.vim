" mkdir -p on save
augroup Mkdir
    autocmd!
    autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p")
augroup END

" Trim whitespace
autocmd BufWritePre * %s/\s\+$//e

" Trim empty lines at the end of the file
autocmd BufWritePre * %s/$\n\+\%$//e
