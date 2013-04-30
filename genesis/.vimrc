" woddfellow2's Vim Config
" by woddfellow2 | http://wlair.us.to/

syntax on

set showcmd
set ruler
set splitbelow
set splitright

set directory=$HOME/.vim/swap

" Fix tab completion
set wildmenu
set wildmode=longest,list

" Because I can:
set shortmess+=I
map ZQ <Nop>

" As per RFC 1855:
autocmd FileType mail set textwidth=64

" Custom command:
command PostUpdate :read !~/scripts/post-update

" Pointless eye candy is pointless
colorscheme polemon

" For vim-powerline
set laststatus=2
