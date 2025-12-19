-- Using rustaceanvim instead of bare lspconfig
local rv = require 'rustaceanvim'
local lsp_attach = require 'me.utils'.lsp_attach
local lsp_capabilities = require 'me.utils'.lsp_capabilities

vim.g.rustaceanvim = {
	server = {
		on_attach = lsp_attach,
		capabilities = lsp_capabilities,
		default_settings = {
			['rust-analyzer'] = {
				procMacro = {
					enable = true
				},
			},
		},
	},
}
