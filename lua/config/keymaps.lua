-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here



vim.keymap.set("i", "<C-s>", "<Esc>:w<cr>a")
-- vim.keymap.set("n", "<leader>r",":ToggleTermSendCurrentLine<cr>")
-- vim.keymap.set("v", "<leader>r",":'<,'>ToggleTermSendVisualSelect<cr>")

-- Kitty
vim.keymap.set("n", "<leader>tr", ":KittyRunCommand<cr>",{ silent = true, desc = "Run a command in a Kitty runner" })
vim.keymap.set("x", "<leader>r", ":KittySendLines<cr>", { silent = true, desc = "Send lines to a Kitty runner" })
vim.keymap.set("n", "<leader>r", ":KittySendLines<cr>", { silent = true, desc = "Send lines to a Kitty runner" })
vim.keymap.set("n", "<leader>tc", ":KittyClearRunner<cr>", { silent = true, desc = "Clear the screen in the Kitty runner" })
vim.keymap.set("n", "<leader>tk", ":KittyKillRunner<cr>", { silent = true, desc = "Kill the Kitty runner" })
vim.keymap.set("n", "<leader>tl", ":KittyReRunCommand<cr>",{ silent = true, desc = "Re-run the last Kitty runner command" })
