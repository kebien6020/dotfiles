local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
	'tsserver',
	'eslint',
	'sumneko_lua',
	'rust_analyzer',
	'clangd',
})

lsp.on_attach(function(_, bufnr)
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
end)

-- Fix LSP for nvim lua files
lsp.nvim_workspace()

lsp.setup()
