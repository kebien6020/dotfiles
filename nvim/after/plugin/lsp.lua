local lsp = vim.lsp
local lsp_attach = require 'me.utils'.lsp_attach
local lsp_capabilities = require 'me.utils'.lsp_capabilities

lsp.config('*', {
	capabilities = lsp_capabilities,
	on_attach = lsp_attach,
})

lsp.enable('metals') -- Scala
lsp.enable('terraformls')
lsp.enable('neocmake')
lsp.enable('hls') -- Haskell
lsp.enable('jsonls')

-- ...the rest are on dedicated files
