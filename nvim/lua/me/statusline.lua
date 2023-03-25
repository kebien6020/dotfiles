function StatusLine()
	local file = '%f'
	local file_status = '%h%w%m%r'
	local lsp_status = '%-{v:lua.require\'lsp-status\'.status()}'
	local sep = '%='
	local loc = '%-14.(%l,%c%V%)'
	local pct = '%P'
	return
		file .. ' ' ..
		file_status ..
		lsp_status ..
		sep ..
		loc .. ' ' ..
		pct
end

vim.opt.statusline = StatusLine()
