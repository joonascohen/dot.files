-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<C-y>", ":split | terminal python % <CR>")
vim.keymap.set("n", "<leader>mdh", "<cmd>MarkdownHeadersClosest<CR>")
vim.keymap.set("n", "<leader>cp", '"+p')
vim.keymap.set("n", "j", "jzz")
vim.keymap.set("n", "n", "nzzzv")
