require("oil-git").setup({
  highlights = {
    OilGitAdded     = { ctermfg = "Green" },
    OilGitModified  = { ctermfg = "Blue" },
    OilGitDeleted   = { ctermfg = "Red" },
    OilGitRenamed   = { ctermfg = "Magenta" },
    OilGitUntracked = { ctermfg = "DarkYellow" },
    OilGitIgnored   = { ctermfg = "DarkGray" },
  }
})
