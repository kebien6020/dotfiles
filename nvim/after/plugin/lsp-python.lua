local lspconfig = require 'lspconfig'
local lsp_attach = require 'me.utils'.lsp_attach
local lsp_capabilities = require 'me.utils'.lsp_capabilities

lspconfig.pyright.setup {
	capabilities = lsp_capabilities,
	on_attach = lsp_attach,
	settings = {
		pyright = {
			inlayHints = {
				variableTypes = true,
				functionReturnTypes = true,
			}
		}
	}
}
