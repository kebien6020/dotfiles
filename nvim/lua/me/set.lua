vim.opt.signcolumn = 'yes'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.listchars = 'eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣'
vim.opt.mouse = 'a'
vim.opt.tabstop = 4 -- Configure indentation width on the fly by only modifying this
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 0
vim.opt.expandtab = false -- AKA. Indent with tabs
vim.opt.encoding = 'utf8'
vim.opt.scrolloff = 4
vim.opt.smartindent = true
vim.opt.fileformats = 'unix,dos' --  Save with LF, try to read as LF or as CRLF
vim.opt.clipboard = 'unnamedplus'
vim.opt.conceallevel = 2 -- Hide superfluous syntax (like json quotes)
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false -- No .swp files
vim.opt.backup = false -- Leave it to undotree
vim.opt.undofile = true
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.updatetime = 50
vim.opt.colorcolumn = '80,120'
vim.opt.showbreak = '⮑'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = 'expr'
vim.opt.foldcolumn = 'auto:9'
vim.opt.exrc = true -- Read local .exrc
vim.opt.secure = true
