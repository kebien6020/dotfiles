require("me.packer")
require("me.remap")
require("me.set")
require("me.statusline")

-- Load local configuration if it exists
if vim.fn.filereadable("~/.nvim.local.lua") == 1 then
	vim.cmd.source("~/.nvim.local.lua")
end
