" woddfellow2's Vim config
" by woddfellow2 | http://wlair.us.to/

" Syntax hilighting
syntax on

set showcmd
set ruler

" Disable splash screen
set shortmess+=I

command PostUpdate :read !~/scripts/post-update.sh
