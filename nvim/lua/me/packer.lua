vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use { 'nvim-telescope/telescope.nvim', -- Fuzzy finder
		branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use {'nvim-telescope/telescope-ui-select.nvim' }

	use 'navarasu/onedark.nvim' -- Theme
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- Parsing framework
	use 'nvim-treesitter/playground' -- Explore tree-sitter AST :TSPlaygroundToggle
	use 'mbbill/undotree' -- Advanced undo
	use 'tpope/vim-fugitive' -- Git integration
	use 'tpope/vim-surround' -- Surround text objects
	use 'lukas-reineke/virt-column.nvim' -- Thin colorcolumn
	use 'christoomey/vim-tmux-navigator'
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
	}

	use 'mfussenegger/nvim-jdtls' -- Java additional support
	use 'simrat39/rust-tools.nvim' -- Rust additional support

	-- Markdown
	use { 'iamcco/markdown-preview.nvim', run = function() vim.fn['mkdp#util#install']() end, } -- Browser preview with :MarkdownPreview
	use { 'ellisonleao/glow.nvim', config = function() require('glow').setup() end }         -- In terminal preview with :Glow


	-- LSP
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' }, -- Required
			{ 'williamboman/mason.nvim' }, -- Optional
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' }, -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'hrsh7th/cmp-buffer' }, -- Optional
			{ 'hrsh7th/cmp-path' }, -- Optional
			{ 'saadparwaiz1/cmp_luasnip' }, -- Optional
			{ 'hrsh7th/cmp-nvim-lua' }, -- Optional

			-- Snippets
			{ 'L3MON4D3/LuaSnip' }, -- Required
			{ 'rafamadriz/friendly-snippets' }, -- Optional

			-- Misc
			{ 'simrat39/symbols-outline.nvim' }, -- LSP Outline
		}
	}
	use 'lvimuser/lsp-inlayhints.nvim'
	use 'nvim-lua/lsp-status.nvim' -- Progress and similar

	-- Copilot
	use 'github/copilot.vim'
end)
