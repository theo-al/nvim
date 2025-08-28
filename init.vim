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

" tabs
set tabstop=4
set shiftwidth=0
set expandtab smarttab smartindent

if has('nvim')
    lua require('init')
endif
