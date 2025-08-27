vim.g.mapleader = " "

--  keymap.set(mode, keybind, command)
vim.keymap.set("n", "<leader>q", "<Cmd>edit %:p:h<CR>")
vim.keymap.set("n", "<leader>so", "<Cmd>source<CR>")

vim.keymap.set("n", " N", function()
    return ":e " .. vim.fn.expand("%:p:h") .. "/"
end, {expr = true})

vim.keymap.set("n", "<leader>a", "$")
vim.keymap.set("n", "<leader>i", "_")

vim.keymap.set("n", "<leader>o", "o<ESC>")
vim.keymap.set("n", "<leader>O", "O<ESC>")


