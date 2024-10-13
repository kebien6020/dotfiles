local lspconfig = require 'lspconfig'
local lspconfig_util = require('lspconfig/util')
local lsp_attach = require 'me.utils'.lsp_attach
local lsp_capabilities = require 'me.utils'.lsp_capabilities

lspconfig.gopls.setup {
	capabilities = lsp_capabilities,
	on_attach = lsp_attach,
	cmd = { "gopls", "serve" },
	filetypes = { "go", "gomod" },
	root_dir = lspconfig_util.root_pattern("go.work", "go.mod", ".git"),
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
}
