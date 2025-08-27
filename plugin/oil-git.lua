require("oil-git").setup({
  highlights = {
    OilGitAdded     = { ctermfg = "Green" },
    OilGitModified  = { ctermfg = "Yellow" },
    OilGitDeleted   = { ctermfg = "Red" },
    OilGitRenamed   = { ctermfg = "Magenta" },
    OilGitUntracked = { ctermfg = "Blue" },
    OilGitIgnored   = { ctermfg = "DarkGray" },
  }
})
