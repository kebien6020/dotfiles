vim.g.mapleader = " "
vim.keymap.set("n", "<leader>j", vim.cmd.bn, {desc = 'Next buffer'})
vim.keymap.set("n", "<leader>k", vim.cmd.bp, {desc = 'Previous buffer'})
vim.keymap.set("n", "<leader>q", vim.cmd.bd, {desc = 'Close buffer'})
vim.keymap.set("n", "<leader>l", function () vim.wo.list = not vim.wo.list end, {desc = 'Toggle showing invisible characters', remap = false})
vim.keymap.set("n", "<leader>/", vim.cmd.nohlsearch, {desc = 'Remove search highlight'})
