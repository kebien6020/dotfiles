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
lsp.enable('neocmake')
lsp.enable('hls') -- Haskell
lsp.enable('jsonls')
lsp.enable('yamlls')
-- ...the rest are on dedicated files

-- LspLog command
vim.api.nvim_create_user_command('LspLog', function()
	local path = vim.lsp.log.get_filename()
	vim.cmd('edit ' .. path)
end, { desc = 'Open LSP log file' })

-- Format command
vim.api.nvim_create_user_command('Format', function()
	vim.lsp.buf.format { async = false }
end, { desc = 'Format current buffer with LSP' })

-- Auto-format for specific filetypes
vim.api.nvim_create_autocmd('BufWritePre', {
	callback = function()
		local matches = vim.bo.filetype == 'terraform'
		if not matches then
			return
		end

		vim.lsp.buf.format { async = false }
	end
})
