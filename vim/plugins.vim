call plug#begin('~/.vim/plugged')

" Sensible defaults
Plug 'tpope/vim-sensible'

" Generic autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" JS/TS
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax

" PHP
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'ncm2/ncm2'
" Plug 'roxma/vim-hug-neovim-rpc'
" Plug 'roxma/nvim-yarp'
" Plug 'phpactor/phpactor'
" Plug 'phpactor/ncm2-phpactor'

" Theme
Plug 'joshdick/onedark.vim'

" UI
Plug 'vim-airline/vim-airline'

" File management
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'

" Text objects
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-surround'

" Misc
Plug 'preservim/nerdcommenter'       " Comment like in VSCode
Plug 'christoomey/vim-tmux-navigator' " Seamless tmux navigation, requires tmux keybindings

call plug#end()
