local telescope = require 'telescope'
local builtin = require 'telescope.builtin'
local themes = require 'telescope.themes'

telescope.setup {
	defaults = {
		-- transparency
		-- winblend = 10,

		path_display = {
			shorten = { len = 1, exclude = { -1, -2 } },
			truncate = 1,
		},
		dynamic_preview_title = true,
		layout_config = {
			horizontal = {
				width = 0.95,
				height = 0.95,
			},
		},
	},
	extensions = {
		['ui-select'] = {
			themes.get_dropdown {},
		},
	},
}

telescope.load_extension('ui-select')

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>fp", builtin.git_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {}) -- Requires ripgrep
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fc", builtin.commands, {})
vim.keymap.set("n", "<leader>fk", builtin.keymaps, {})
