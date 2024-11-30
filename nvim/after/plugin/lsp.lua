local lspconfig = require('lspconfig')
local lsp_attach = require 'me.utils'.lsp_attach
local lsp_capabilities = require 'me.utils'.lsp_capabilities
local outline = require 'symbols-outline'
local status = require 'lsp-status'

lspconfig.clangd.setup { capabilities = lsp_capabilities, on_attach = lsp_attach }
lspconfig.metals.setup { capabilities = lsp_capabilities, on_attach = lsp_attach } -- Scala
lspconfig.terraformls.setup { capabilities = lsp_capabilities, on_attach = lsp_attach }

-- ...the rest are on dedicated files

-- Outline
outline.setup()
vim.keymap.set('n', '<leader>so', vim.cmd.SymbolsOutline)

-- Status Line at the bottom
status.config { indicator_ok = '[OK]', status_symbol = '' }
status.register_progress()

-- Start Inlay Hint provider
-- ih.setup()
-- vim.cmd.hi('LspInlayHint guifg=#555555 guibg=NONE')
-- vim.keymap.set('n', '<leader>si', ih.toggle)
