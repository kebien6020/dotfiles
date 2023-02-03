vim.g.mapleader = " "
-- Buffer
vim.keymap.set("n", "<leader>j", vim.cmd.bn, { desc = 'Next buffer' })
vim.keymap.set("n", "<leader>k", vim.cmd.bp, { desc = 'Previous buffer' })
vim.keymap.set("n", "<leader>q", vim.cmd.bd, { desc = 'Close buffer' })
-- Misc
vim.keymap.set("n", "<leader>l", function() vim.wo.list = not vim.wo.list end,
	{ desc = 'Toggle showing invisible characters', remap = false })
vim.keymap.set("n", "<leader>/", vim.cmd.nohlsearch, { desc = 'Remove search highlight' })
-- Nicer versions of default maps
vim.keymap.set('n', 'J', 'mzJ`z') -- J keeps cursor in place
vim.keymap.set('n', '<C-d>', '<C-d>zz') -- Auto center <C-d> <C-z> n and N
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('x', 'p', '"_dP') -- Paste over selection without losing copy
-- Move lines
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
-- Poor's man rename
vim.keymap.set('n', '<leader>.', ':%s/\\<<C-r><C-w>\\>//g<Left><Left>')
