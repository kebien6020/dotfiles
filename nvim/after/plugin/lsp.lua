local lspconfig = require('lspconfig')
local lsp_attach = require 'me.utils'.lsp_attach
local lsp_capabilities = require 'me.utils'.lsp_capabilities

lspconfig.clangd.setup { capabilities = lsp_capabilities, on_attach = lsp_attach }
lspconfig.metals.setup { capabilities = lsp_capabilities, on_attach = lsp_attach } -- Scala
lspconfig.terraformls.setup { capabilities = lsp_capabilities, on_attach = lsp_attach }
lspconfig.neocmake.setup { capabilities = lsp_capabilities, on_attach = lsp_attach }
lspconfig.hls.setup { capabilities = lsp_capabilities, on_attach = lsp_attach } -- Haskell

-- ...the rest are on dedicated files
