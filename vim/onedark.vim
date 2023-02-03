let g:onedark_hide_endofbuffer = 1
let g:onedark_termcolors = 256
let g:onedark_terminal_italics = 1

function! Transparent()
	highlight Normal ctermbg=NONE guibg=NONE
	highlight LineNr ctermbg=NONE guibg=NONE
	highlight Folded ctermbg=NONE guibg=NONE
	highlight NonText ctermbg=NONE guibg=NONE
	highlight SpecialKey ctermbg=NONE guibg=NONE
	highlight VertSplit ctermbg=NONE guibg=NONE
	highlight SignColumn ctermbg=NONE guibg=NONE
endfunction

autocmd ColorScheme onedark call Transparent()
