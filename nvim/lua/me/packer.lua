vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function (use)
	use 'wbthomason/packer.nvim'
	use{'nvim-telescope/telescope.nvim', -- Fuzzy finder
	  branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}
	use 'navarasu/onedark.nvim' -- Theme
	use{'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}} -- Parsing framework
	use 'nvim-treesitter/playground' -- Explore tree-sitter AST :TSPlaygroundToggle
	use 'mbbill/undotree' -- Advanced undo
	use 'tpope/vim-fugitive' -- Git integration
	use 'lukas-reineke/virt-column.nvim' -- Thin colorcolumn
	use 'christoomey/vim-tmux-navigator'
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}

	use 'mfussenegger/nvim-jdtls' -- Java additional support

	-- LSP
	use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
	    -- LSP Support
	    {'neovim/nvim-lspconfig'},             -- Required
	    {'williamboman/mason.nvim'},           -- Optional
	    {'williamboman/mason-lspconfig.nvim'}, -- Optional

	    -- Autocompletion
	    {'hrsh7th/nvim-cmp'},         -- Required
	    {'hrsh7th/cmp-nvim-lsp'},     -- Required
	    {'hrsh7th/cmp-buffer'},       -- Optional
	    {'hrsh7th/cmp-path'},         -- Optional
	    {'saadparwaiz1/cmp_luasnip'}, -- Optional
	    {'hrsh7th/cmp-nvim-lua'},     -- Optional

	    -- Snippets
	    {'L3MON4D3/LuaSnip'},             -- Required
	    {'rafamadriz/friendly-snippets'}, -- Optional
	  }
	}
	use 'lvimuser/lsp-inlayhints.nvim'
end)
