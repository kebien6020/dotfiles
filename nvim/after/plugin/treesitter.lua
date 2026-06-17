-- Use xml parser for html files
vim.treesitter.language.register('html', 'xml')

-- In arch linux, parsers are installed via the group `tree-sitter-grammars`
-- and are located in `/usr/lib/tree_sitter/`
-- Neovim by default checks on runtimepath under `parser/lang.*` so we need to use the manual parser registration method

for filename in vim.fs.dir('/usr/lib/tree_sitter/') do
	local path = '/usr/lib/tree_sitter/' .. filename
	local lang = filename:match('lang%.(.*)%.so')
	if lang then
		vim.treesitterlanguage.add(lang, { path = path })
	end
end
