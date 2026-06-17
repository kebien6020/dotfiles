-- Use xml parser for html files
vim.treesitter.language.register('html', 'xml')

-- In arch linux, parsers are installed via the group `tree-sitter-grammars`
-- and are located in `/usr/lib/tree_sitter/`
-- Neovim by default checks on runtimepath under `parser/lang.*` so we need to use the manual parser registration method

for filename in vim.fs.dir('/usr/lib/tree_sitter/') do
	local path = '/usr/lib/tree_sitter/' .. filename
	local lang = filename:match('lang%.(.*)%.so')
	if lang then
		vim.treesitter.language.add(lang, { path = path })
	end
end

-- In MacOS, brew install tree-sitter-cli, then run
-- `tree-sitter init-config`, edit the config file at ~/.config/tree-sitter/config.json
-- to add ~/ts-grammars as the path for parsers, then clone parsers into that directory
--
-- mkdir ~/ts-grammars
-- cd ~/ts-grammars
-- git clone https://github.com/tree-sitter-grammars/tree-sitter-yaml
-- git clone https://github.com/tree-sitter/tree-sitter-json
-- tree-sitter build tree-sitter-yaml
-- tree-sitter build tree-sitter-json
local grammars_path = vim.fn.expand('~/ts-grammars/')
for filename in vim.fs.dir(grammars_path) do
	local path = grammars_path .. filename
	local lang = filename:match('(.*)%.dylib')
	if lang then
		vim.treesitter.language.add(lang, { path = path })
	end
end
