" remaps
vnoremap <C-c> "+y
nnoremap <Y> y$

" status column
set number
set relativenumber

" colors
colorscheme habamax
set notermguicolors
highlight FloatBorder ctermbg=NONE ctermfg=NONE
highlight NormalFloat ctermbg=NONE ctermfg=NONE

" extra characters
set list
set listchars=tab:\|\ ,trail:·,nbsp:␣,extends:>,precedes:<

" tabs
set tabstop=4
set shiftwidth=0
set expandtab smarttab smartindent

" source main config
if has('nvim')
    lua require('init')
endif
