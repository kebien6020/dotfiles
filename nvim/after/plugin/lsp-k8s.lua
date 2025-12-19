local lsp = vim.lsp

lsp.config('yamlls', {
	settings = {
		yaml = {
			schemas = {
				kubernetes = "k8s/*.yaml"
			}
		},
	},
})
