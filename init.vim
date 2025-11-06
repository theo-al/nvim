" bare minimum
set number
set relativenumber
set undofile

vnoremap <C-c> "+y
nnoremap <Y> y$

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

" terminal
if exists(':terminal')
  augroup TermFixes
    autocmd!
    autocmd TermOpen * startinsert
    autocmd TermOpen * tnoremap <buffer> <Esc> <C-\><C-n>
    autocmd TermOpen * setlocal nonumber norelativenumber signcolumn=no
    autocmd TermOpen * ++once call s:TermNoWrite()
  augroup END

  function! s:TermNoWrite() abort
    " buffer-local no-op command (must be uppercase)
    command! -buffer W echohl None | echo "" | echohl None

    " make :w expand to :W only in this buffer
    execute 'iabbrev <buffer> w W'
    execute 'cabbrev <buffer> w W'
  endfunction
endif

" source main config
if has('nvim')
    lua require('init')
endif
