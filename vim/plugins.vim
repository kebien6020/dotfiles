call plug#begin('~/.vim/plugged')

" Sensible defaults
Plug 'tpope/vim-sensible'

" Generic autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" JS/TS
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" Purescript
Plug 'purescript-contrib/purescript-vim'

" Rescript
Plug 'rescript-lang/vim-rescript'

" Elixir
Plug 'elixir-editors/vim-elixir'

" Theme
Plug 'joshdick/onedark.vim'

" UI
Plug 'vim-airline/vim-airline'

" File management
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" Interactive git checkout with :Merginal
Plug 'idanarye/vim-merginal'
Plug 'jreybert/vimagit'

" Text objects
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-surround'

" Misc
Plug 'joereynolds/gq.vim'             " Language aware gq formatting
Plug 'preservim/nerdcommenter'        " Comment like in VSCode
Plug 'christoomey/vim-tmux-navigator' " Seamless tmux navigation, requires tmux keybindings
Plug 'tpope/vim-obsession'            " Sessions. tmux-ressurrect will restore vim sessions

call plug#end()
