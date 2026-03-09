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
	settings = {
		eslint = {
			autoFixOnSave = false,
			format = { enable = true }
		},
	},
})

vim.api.nvim_create_autocmd('LspAttach', {
	pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	callback = function(args)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = args.buf,
			command = "LspEslintFixAll",
		})
	end,
})

lsp.enable({'ts_ls', 'eslint'})
