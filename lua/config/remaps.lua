vim.g.mapleader = " "

vim.keymap.set("n", "<leader>rc", function () vim.cmd.e("$MYVIMRC") end)

vim.keymap.set("n", "<C-n>", vim.cmd.Ex)

-- This unsets the "last search pattern" register by hitting return
vim.keymap.set("n", "<C-c><C-c>", vim.cmd.noh, { silent = true })

-- Resize windows quickly
vim.keymap.set("n", "<m-h>", function () vim.cmd.resize(-2) end, { silent = true })
vim.keymap.set("n", "<m-j>", function () vim.cmd.resize(2) end, { silent = true })
vim.keymap.set("n", "<m-k>", function () vim.cmd.resize(-2) end, { silent = true })
vim.keymap.set("n", "<m-l>", function () vim.cmd.resize(2) end, { silent = true })
