local ih = require('lsp-inlayhints')
local lspconfig = require('lspconfig')
local util = require('lspconfig/util')

require('mason').setup()

require('mason-lspconfig').setup({
	ensure_installed = {
		'tsserver',
		'eslint',
		'lua_ls',
		'rust_analyzer',
		'clangd',
		'gopls',
	}
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local lsp_attach = function(c, b)
	local opts = function(desc) return { buffer = b, remap = false, desc = desc } end

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

	local cap = c.server_capabilities
	if cap.document_highlight then
		vim.api.nvim_create_autocmd('CursorHold', { buffer = b, callback = vim.lsp.buf.document_highlight })
		vim.api.nvim_create_autocmd('CursorMoved', { buffer = b, callback = vim.lsp.buf.clear_references })
	end
	vim.api.nvim_create_autocmd('BufWritePre',
		{ buffer = b, callback = function() vim.lsp.buf.format { async = false } end })

	ih.on_attach(c, b)
end

-- vim.lsp.set_log_level('debug')

require('mason-lspconfig').setup_handlers({
	function(server_name)
		lspconfig[server_name].setup {
			on_attach = lsp_attach,
			capabilities = lsp_capabilities,
		}
	end,
	['jdtls'] = function()
		lspconfig.jdtls.setup({
			on_attach = function(c, b)
				lsp_attach(c, b)

				local config = {
					cmd = { 'jdtls' },
					root_dir = vim.fs.dirname(vim.fs.find({ '.gradlew', '.git', 'mvnw' }, { upward = true })[1]),
				}
				require('jdtls').start_or_attach(config)

			end,
			-- cmd = { '/Users/kevin/.local/share/nvim/mason/bin/jdtls' },
			init_options = {
				settings = {
					java = {
						home = '/opt/homebrew/Cellar/openjdk/19.0.1/libexec/openjdk.jdk/Contents/Home/',
					},
					configuration = {
						checkProjectSettingsExclusions = true,
						updateBuildConfiguration = "interactive",
					},
					import = {
						maven = {
							enabled = true,
						},
					},
					inlayHints = {
						parameterNames = {
							enabled = 'literals', -- none|literals|all
							exclusions = {}, -- Function patterns
						},
					},
				},
			},
		})
	end,
	['tsserver'] = function()
		lspconfig.tsserver.setup({
			on_attach = lsp_attach,
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
	end,
	["lua_ls"] = function()
		lspconfig.lua_ls.setup {
			on_attach = lsp_attach,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" }
					}
				}
			}
		}
	end,
	['gopls'] = function()
		lspconfig.gopls.setup {
			on_attach = lsp_attach,
			cmd = { "gopls", "serve" },
			filetypes = { "go", "gomod" },
			root_dir = util.root_pattern("go.work", "go.mod", ".git"),
			settings = {
				gopls = {
					hints = {
						-- assignVariableTypes = true,
						constantValues = true,
						functionTypeParameters = true,
						parameterNames = true,
						rangeVariableTypes = true,
					},
				},
			},
		}
	end,
})

-- Start Inlay Hint provider
ih.setup()
vim.cmd.hi('LspInlayHint guifg=#00ffff guibg=#000000')
