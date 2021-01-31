call plug#begin('~/.vim/plugged')

" Sensible defaults
Plug 'tpope/vim-sensible'

" JS/TS
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'Quramy/tsuquyomi'

" Theme
Plug 'joshdick/onedark.vim'

" UI
Plug 'vim-airline/vim-airline'

" File management
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'

" Text objects
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-surround'

call plug#end()
