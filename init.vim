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

" terminal
augroup TermFixes
  autocmd!
  autocmd TermOpen * startinsert
  autocmd TermOpen * tnoremap <buffer> <Esc> <C-\><C-n>
  autocmd TermOpen * setlocal nonumber norelativenumber signcolumn=no
  autocmd TermOpen * setlocal statuscolumn=
  autocmd TermOpen * ++once call s:TermNoWrite()
augroup END

function! s:TermNoWrite() abort
  " buffer-local no-op command (must be uppercase)
  command! -buffer W echohl None | echo "" | echohl None

  " make :w expand to :W only in this buffer
  " use cmdmode abbreviation (safer than cnoremap)
  execute 'iabbrev <buffer> w W'
  execute 'cabbrev <buffer> w W'
endfunction

" source main config
if has('nvim')
    lua require('init')
endif
