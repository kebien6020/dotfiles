local lspconfig = require 'lspconfig'
local lsp_attach = require 'me.utils'.lsp_attach
local lsp_capabilities = require 'me.utils'.lsp_capabilities

lspconfig.ts_ls.setup {
	capabilities = lsp_capabilities,
	on_attach = lsp_attach,
	settings = {
		javascript = {
			inlayHints = {
				includeInlayEnumMemberValueHints = false,
				includeInlayFunctionLikeReturnTypeHints = false,
				includeInlayFunctionParameterTypeHints = false,
				includeInlayParameterNameHints = "none", -- 'none' | 'literals' | 'all';
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayPropertyDeclarationTypeHints = false,
				includeInlayVariableTypeHints = false,
			},
		},
		typescript = {
			inlayHints = {
				includeInlayEnumMemberValueHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayFunctionParameterTypeHints = false,
				includeInlayParameterNameHints = "literals", -- 'none' | 'literals' | 'all';
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayPropertyDeclarationTypeHints = false,
				includeInlayVariableTypeHints = false,
			},
		},
	},
}

lspconfig.eslint.setup {
	capabilities = lsp_capabilities,
	on_attach = function(c, b)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = b,
			command = "EslintFixAll",
		})
		lsp_attach(c, b)
	end,
	settings = {
		eslint = {
			autoFixOnSave = false,
			format = { enable = true }
		},
	},
}
