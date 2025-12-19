local lsp = vim.lsp
local lsp_attach = require 'me.utils'.lsp_attach

lsp.config('ts_ls', {
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
})

lsp.config('eslint', {
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
})
