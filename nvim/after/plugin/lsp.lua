local lsp = vim.lsp
local lsp_attach = require 'me.utils'.lsp_attach
local lsp_capabilities = require 'me.utils'.lsp_capabilities

lsp.config('*', {
	capabilities = lsp_capabilities,
})

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local buffer = args.buf
		local client = lsp.get_client_by_id(args.data.client_id)
		lsp_attach(client, buffer)
	end,
})

lsp.enable('clangd')
lsp.enable('metals') -- Scala
lsp.enable('terraformls')
lsp.enable('neocmake')
lsp.enable('hls') -- Haskell
lsp.enable('jsonls')

-- ...the rest are on dedicated files
