local lspconfig = require 'lspconfig'
local lsp_attach = require 'me.utils'.lsp_attach
local lsp_capabilities = require 'me.utils'.lsp_capabilities

lspconfig.lua_ls.setup {
	capabilities = lsp_capabilities,
	on_attach = lsp_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" }
			}
		}
	}
}
