local lsp = vim.lsp
local lspconfig_util = require('lspconfig.util')

lsp.config('gopls', {
	cmd = { "gopls", "serve" },
	filetypes = { "go", "gomod" },
	settings = {
		gopls = {
			hints = {
				-- assignVariableTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
		},
	},
})
lsp.enable('gopls')
