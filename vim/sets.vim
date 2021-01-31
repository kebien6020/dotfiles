set number
set relativenumber
set nu
set mouse=a
set ttymouse=sgr
set hidden
set encoding=utf-8
set scrolloff=4
set belloff=all
set timeout timeoutlen=100 ttimeoutlen=100
" Mode is shown in airline
set noshowmode

" TABS
filetype plugin indent on
" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab

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
