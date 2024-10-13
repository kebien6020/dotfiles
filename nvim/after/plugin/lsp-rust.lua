local lsp_attach = require 'me.utils'.lsp_attach
local lsp_capabilities = require 'me.utils'.lsp_capabilities
local rt = require 'rust-tools'

rt.setup {
	capabilities = lsp_capabilities,
	server = {
		on_attach = lsp_attach,
		settings = {
			['rust-analyzer'] = {
				procMacro = {
					enable = true
				},
			},
		},
	}
}
