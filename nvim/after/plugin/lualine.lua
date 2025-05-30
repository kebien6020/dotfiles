local lualine = require 'lualine'

lualine.setup {
	options = {
		theme = 'onedark',
		section_separators = '',
		component_separators = '',
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = {
			'branch',
			{ 'diagnostics',
				symbols = { error = 'E', warn = 'W', info = 'I', hint = 'H' },
			}
		},
		lualine_c = { 'filename', 'lsp_status' },
		lualine_x = { 'encoding', 'fileformat', 'filetype' },
		lualine_y = { 'progress' },
		lualine_z = { 'location' }
	},
}
