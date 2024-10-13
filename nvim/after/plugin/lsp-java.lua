local lsp_attach = require 'me.utils'.lsp_attach
local lsp_capabilities = require 'me.utils'.lsp_capabilities

vim.api.nvim_create_autocmd('FileType', {
	pattern = 'java',
	callback = function()
		require('jdtls').start_or_attach({
			cmd = { 'jdtls' },
			on_attach = lsp_attach,
			capabilities = lsp_capabilities,
		})
	end,
})

-- Enable Java LSP on jdt:// links
vim.api.nvim_create_autocmd('BufReadCmd', {
	pattern = 'jdt://*',
	callback = function(opts)
		local buf = opts.buf
		local client
		for _, c in ipairs(vim.lsp.get_active_clients()) do
			if c.config.init_options
				and c.config.init_options.extendedClientCapabilities
				and c.config.init_options.extendedClientCapabilities.classFileContentsSupport then
				client = c
				break
			end
		end
		vim.notify(
			"Kev: Manually attaching client " .. client.id .. " to buffer " .. buf,
			vim.log.levels.DEBUG)
		vim.lsp.buf_attach_client(buf, client.id)
		lsp_attach(client, buf)
		vim.api.nvim_create_autocmd('CursorHold', { buffer = buf, callback = vim.lsp.buf.document_highlight })
		vim.api.nvim_create_autocmd('CursorMoved', { buffer = buf, callback = vim.lsp.buf.clear_references })
	end,
})
