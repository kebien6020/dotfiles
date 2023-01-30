local lsp = require('lsp-zero')
local ih = require('lsp-inlayhints')

lsp.preset('recommended')

lsp.ensure_installed({
	'tsserver',
	'eslint',
	'sumneko_lua',
	'rust_analyzer',
	'clangd',
})

local attach_bindings = function(_, bufnr)
	local opts = function(desc) return { buffer = bufnr, remap = false, desc = desc } end

	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts('LSP Go to definition'))
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts('LSP Hover'))
	vim.keymap.set('n', '<leader>sd', vim.diagnostic.open_float, opts('Open float'))
	vim.keymap.set('n', ']g', vim.diagnostic.goto_next, opts('Next diagnostic'))
	vim.keymap.set('n', '[g', vim.diagnostic.goto_prev, opts('Previous diagnostic'))
	vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, opts('LSP Code action'))
	vim.keymap.set('n', '<leader>sa', vim.lsp.buf.code_action, opts('LSP Code action'))
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts('LSP Goto references'))
	vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts('LSP Rename'))
	vim.keymap.set('n', '<leader>sr', vim.lsp.buf.rename, opts('LSP Rename'))
	vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts('LSP Signature help'))
end

lsp.on_attach(attach_bindings)

-- Fix LSP for nvim lua files
lsp.nvim_workspace()


-- Inlay hints
lsp.configure('tsserver', {
  on_attach = function(c, b)
    ih.on_attach(c, b)
	attach_bindings(c, b)
  end,
  settings = {
    javascript = {
      inlayHints = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
    },
    typescript = {
      inlayHints = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
    },
  },
})

ih.setup()
lsp.setup()

