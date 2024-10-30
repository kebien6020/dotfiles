vim.keymap.set('i', '<C-a>', 'copilot#Accept("")', {
	expr = true,
	replace_keycodes = false
})
vim.g.copilot_no_tab_map = true

require("CopilotChat").setup {
	-- debug = true,
	-- See Configuration section for rest
}
