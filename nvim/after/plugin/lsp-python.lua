local lsp = vim.lsp

lsp.config('pyright', {
	settings = {
		pyright = {
			inlayHints = {
				variableTypes = true,
				functionReturnTypes = true,
			}
		}
	}
})
lsp.enable('pyright')
