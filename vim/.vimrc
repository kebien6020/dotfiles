" enter the current millenium
set nocompatible

" Start from vim defaults (instead of vi defaults)
source $VIMRUNTIME/vimrc_example.vim

" Source user configs
let $DOT = $HOME . '/.dotfiles'
source $DOT/vim/plugins.vim
source $DOT/vim/sets.vim
source $DOT/vim/map.vim
source $DOT/vim/gui.vim
source $DOT/vim/color.vim
source $DOT/vim/autocommands.vim
source $DOT/vim/ruler.vim

source $DOT/vim/airline.vim
source $DOT/vim/coc.vim
source $DOT/vim/ctrlp.vim
source $DOT/vim/fugitive.vim
source $DOT/vim/fzf.vim
source $DOT/vim/go.vim
source $DOT/vim/nerdcommenter.vim
source $DOT/vim/nerdtree.vim
source $DOT/vim/onedark.vim

silent! colorscheme onedark
