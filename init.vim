" remaps
vnoremap <C-c> "+y
nnoremap <Y> y$

" status column
set number
set relativenumber

" colors
set notermguicolors
colorscheme habamax

" tabs
set tabstop=4
set shiftwidth=0
set expandtab smarttab smartindent

if has('nvim')
    lua require('init')
endif
