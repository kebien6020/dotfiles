local lsp = vim.lsp

lsp.config('terraformls', {
	cmd = { 'terraform-ls', 'serve' },
	filetypes = { 'terraform', 'terraform-vars' },
	root_markers = { '.terraform', '.git' },
	capabilities = {
		experimental = {
			showReferencesCommandId = 'client.showReferences',
		},
	},
	on_attach = function(client, bufnr)
		-- Next line is because of https://github.com/hashicorp/terraform-ls/issues/2125
		client.server_capabilities.semanticTokensProvider = nil

		vim.lsp.codelens.enable(true, { bufnr = bufnr })
	end,
})

lsp.enable('terraformls')
