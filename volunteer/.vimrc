" woddfellow2's Vim Config
" by woddfellow2 | http://wlair.us.to/

" Note that this is very short compared to many people's ~/.vimrc files;
" this is because Vim has sane defaults.

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

" Pointless eye candy is pointless
colorscheme polemon
