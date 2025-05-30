require("me.packer")
require("me.remap")
require("me.set")

-- Load local configuration if it exists
if vim.fn.filereadable(os.getenv('HOME') .. '/.nvim.local.lua') == 1 then
	vim.cmd.source(os.getenv('HOME') .. '/.nvim.local.lua')
end
