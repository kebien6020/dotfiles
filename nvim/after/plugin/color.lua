local onedark = require('onedark')

onedark.setup {
	transparent = true,
	style = 'deep',
	lualine = {
		transparent = true,
	},
}

onedark.load()

vim.api.nvim_create_user_command('OnedarkStyle', function(opts)
	onedark.set_options('style', opts.fargs[1])
	onedark.load()
end, {
	nargs = 1,
	complete = function()
		return onedark.styles_list
	end
})

vim.api.nvim_create_user_command('OnedarkTransparent', function(opts)
	onedark.set_options('transparent', opts.fargs[1] == 'true' and true or false)
	onedark.load()
end, {
	nargs = 1,
	complete = function()
		return { 'true', 'false' }
	end
})
