local ih = require('lsp-inlayhints')
local lspconfig = require('lspconfig')
local util = require('lspconfig/util')
local cmp = require 'cmp'
local luasnip = require 'luasnip'
local status = require 'lsp-status'

-- vim.lsp.set_log_level('debug')

require('mason').setup()

require('mason-lspconfig').setup({
	ensure_installed = {
		'tsserver',
		'eslint',
		'lua_ls',
		'rust_analyzer',
		'clangd',
		'gopls',
		'pyright',
	}
})

status.config {
	indicator_ok = '[OK]',
	status_symbol = '',
}

status.register_progress()

local lsp_capabilities = vim.tbl_extend('keep',
	require('cmp_nvim_lsp').default_capabilities(),
	status.capabilities
)

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
	if cap.document_highlight or cap.documentHighlightProvider then
		vim.api.nvim_create_autocmd('CursorHold', { buffer = b, callback = vim.lsp.buf.document_highlight })
		vim.api.nvim_create_autocmd('CursorMoved', { buffer = b, callback = vim.lsp.buf.clear_references })
	end
	vim.api.nvim_create_autocmd('BufWritePre',
		{ buffer = b, callback = function() vim.lsp.buf.format { async = false } end })

	ih.on_attach(c, b)
	status.on_attach(c)
end

require('mason-lspconfig').setup_handlers({
	function(server_name)
		lspconfig[server_name].setup {
			on_attach = lsp_attach,
			capabilities = lsp_capabilities,
		}
	end,
	['jdtls'] = function()
		lspconfig.jdtls.setup({
			capabilities = lsp_capabilities,
			on_attach = function(c, b)
				lsp_attach(c, b)
				vim.api.nvim_create_autocmd('CursorHold', { buffer = b, callback = vim.lsp.buf.document_highlight })
				vim.api.nvim_create_autocmd('CursorMoved', { buffer = b, callback = vim.lsp.buf.clear_references })

				local config = {
					cmd = { 'jdtls' },
					root_dir = vim.fs.dirname(vim.fs.find({ '.gradlew', '.git', 'mvnw' }, { upward = true })[1]),
				}
				require('jdtls').start_or_attach(config)

			end,
			cmd = {
				'/home/kevin/srcs/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/bin/jdtls',
				'-configuration', '/home/kevin/.cache/jdtls/config',
				'-data', '/home/kevin/.cache/jdtls/workspace'
			},

			settings = {
				java = {
					configuration = {
						checkProjectSettingsExclusions = true,
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
			capabilities = lsp_capabilities,
			on_attach = lsp_attach,
			settings = {
				javascript = {
					inlayHints = {
						includeInlayEnumMemberValueHints = true,
						includeInlayFunctionLikeReturnTypeHints = true,
						includeInlayFunctionParameterTypeHints = true,
						includeInlayParameterNameHints = "literals", -- 'none' | 'literals' | 'all';
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
						includeInlayParameterNameHints = "literals", -- 'none' | 'literals' | 'all';
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
			capabilities = lsp_capabilities,
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
			capabilities = lsp_capabilities,
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
	['pyright'] = function()
		lspconfig.pyright.setup {
			on_attach = lsp_attach,
			settings = {
				pyright = {
					inlayHints = {
						variableTypes = true,
						functionReturnTypes = true,
					}
				}
			}
		}
	end,
})

-- Start Inlay Hint provider
ih.setup()
vim.cmd.hi('LspInlayHint guifg=#555555 guibg=NONE')
vim.keymap.set('n', '<leader>si', ih.toggle)

-- Automatic completion triggering
cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
		['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
		-- C-b (back) C-f (forward) for snippet placeholder navigation.
		['<C-Space>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
	}),
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	},
}
