" Remappings
inoremap jk <Esc>

" Leader
nnoremap <Space> <Nop>
vnoremap <Space> <Nop>
let mapleader = " "

" Use semicolon as colon
nnoremap ; :
" Gain semicolon back using ;;
nnoremap ;; ;

" <leader>. to repeat the last edit on the next occurence of the word
nnoremap <leader>. :let @/=@"<cr>/<cr>cgn<c-r>.<esc>

" Move up/down with Alt-j Alt-k
execute "set <M-j>=\ej"
execute "set <M-k>=\ek"
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
inoremap <M-j> <Esc>:m .+1<CR>==gi
inoremap <M-k> <Esc>:m .-2<CR>==gi
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv

" Buffer movement
noremap  <silent> <C-PageDown> :bnext<CR>
noremap  <silent> <C-PageUp> :bprevious<CR>
nnoremap <silent> <leader>j :bprevious<CR>
nnoremap <silent> <leader>k :bnext<CR>
nnoremap <silent> <C-x> :bdelete<CR>

" Leader shortcuts
nnoremap <silent> <leader>l :set list!<CR>
nnoremap <silent> <leader>q :bdelete<CR>
nnoremap <silent> <leader>r :so ~/.vimrc<CR>
nnoremap <silent> <leader>g :Git<CR>
