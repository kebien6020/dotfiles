set number
set relativenumber
set nu
set mouse=a
if !has('nvim')
	set ttymouse=sgr
endif
set hidden
set encoding=utf-8
set scrolloff=4
set belloff=all
set timeout timeoutlen=100 ttimeoutlen=50
set nohlsearch
" Mode is shown in airline
set noshowmode
" Save with LF, try to read as LF or as CRLF
set fileformats=unix,dos
" All whitespace when doing :set list
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
" System clipboard
set clipboard=unnamed
" Thin cursor on insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
" Time to trigger a CursorHold
set updatetime=200
" Conceal
set conceallevel=2
" Allow for local .exrc file for project-specific settings
set exrc

" TABS
filetype plugin indent on
" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set noexpandtab

" Splits
set splitbelow
set splitright

" Place swap files in a temporary folder
" so that you can use git add -A normally
set directory^=$HOME/.vim/tmp//
set backupdir^=$HOME/.vim/tmp//
set undodir^=$HOME/.vim/tmp//

" Wildmenu

" Display all matching files when we tab complete
set wildmenu
set wildcharm=<C-Z>

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Markdown code block syntax highlighting
let g:markdown_fenced_languages = [
  \ 'css',
  \ 'erb=eruby',
  \ 'javascript',
  \ 'js=javascript',
  \ 'json',
  \ 'ruby',
  \ 'sass',
  \ 'xml',
  \ 'html',
  \ 'diff',
  \ 'rego',
  \ ]
