vim.cmd([[
  :highlight GitSignsAdd    ctermbg=NONE ctermfg=green
  :highlight GitSignsChange ctermbg=NONE ctermfg=blue
  :highlight GitSignsDelete ctermbg=NONE ctermfg=red
  :highlight SignColumn     ctermbg=NONE ctermfg=NONE

  " word diff
  :hi GitSignsAddInline    ctermbg=NONE    ctermfg=NONE cterm=italic
  :hi GitSignsDeleteInline ctermbg=darkred ctermfg=NONE cterm=underline
  :hi GitSignsChangeInline ctermbg=NONE    ctermfg=NONE cterm=underline
]])

require('gitsigns').setup {
  signs = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },

  signs_staged_enable = true,
  signcolumn = true , -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = true,  -- Toggle with `:Gitsigns toggle_word_diff`

  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`

  watch_gitdir = {
    follow_files = true
  },

  auto_attach = true,
  attach_to_untracked = false,
  sign_priority = 6,

  update_debounce = 100,
}
