vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use { 'nvim-telescope/telescope.nvim', -- Fuzzy finder
		branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use { 'nvim-telescope/telescope-ui-select.nvim' }

	use 'navarasu/onedark.nvim'                               -- Theme
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- Parsing framework
	use 'nvim-treesitter/playground'                          -- Explore tree-sitter AST :TSPlaygroundToggle
	use 'mbbill/undotree'                                     -- Advanced undo
	use 'tpope/vim-fugitive'                                  -- Git integration
	use 'tpope/vim-surround'                                  -- Surround text objects
	use 'lukas-reineke/virt-column.nvim'                      -- Thin colorcolumn
	use 'christoomey/vim-tmux-navigator'
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
	}

	-- Java
	use { 'mfussenegger/nvim-jdtls', requires = { 'mfussenegger/nvim-dap' } }

	-- Rust
	use 'simrat39/rust-tools.nvim' -- Rust additional support

	-- Markdown
	use { 'iamcco/markdown-preview.nvim', run = function() vim.fn['mkdp#util#install']() end, } -- Browser preview with :MarkdownPreview
	use { 'ellisonleao/glow.nvim', config = function() require('glow').setup() end }         -- In terminal preview with :Glow


	-- Autocompletion
	use 'hrsh7th/nvim-cmp'      -- Required
	use 'hrsh7th/cmp-nvim-lsp'  -- Required
	use 'hrsh7th/cmp-buffer'    -- Optional
	use 'hrsh7th/cmp-path'      -- Optional
	use 'saadparwaiz1/cmp_luasnip' -- Optional
	use 'L3MON4D3/LuaSnip'      -- Required
	use 'hrsh7th/cmp-nvim-lua'  -- Optional

	-- LSP
	use 'neovim/nvim-lspconfig'
	use 'simrat39/symbols-outline.nvim'
	use 'nvim-lua/lsp-status.nvim' -- Status line at the bottom
	use 'lvimuser/lsp-inlayhints.nvim'

	-- Debugging
	use 'mfussenegger/nvim-dap'

	-- Copilot
	use 'github/copilot.vim'
	-- use 'CopilotC-Nvim/CopilotChat.nvim'
end)
