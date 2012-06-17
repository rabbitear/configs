" woddfellow2's Vim config
" by woddfellow2 | http://wlair.us.to/

" Note that this is very short compared to many people's ~/.vimrc files;
" this is because Vim has sane defaults.

syntax on

set showcmd
set ruler

" Because I can:
set shortmess+=I
map ZQ <Nop>

" Custom command:
command PostUpdate :read !~/scripts/post-update.sh
