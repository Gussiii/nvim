-- https://www.youtube.com/watch?v=435-amtVYJ8
-- https://github.com/LunarVim/Neovim-from-scratch/blob/02-keymaps/lua/user/keymaps.lua

local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

-- keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- -- Resize with arrows
-- keymap("n", "<S-Up>", ":resize -2<CR>", opts)
-- keymap("n", "<S-Down>", ":resize +2<CR>", opts)
-- keymap("n", "<S-Right>", ":vertical resize -2<CR>", opts)
-- keymap("n", "<S-Left>", ":vertical resize +2<CR>", opts)

-- -- Navigate buffers
-- keymap("n", "<S-o>", ":bnext<CR>", opts)
-- keymap("n", "<S-p>", ":bprevious<CR>", opts)

-- -- Move text up and down
-- keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- -- Insert --
-- -- Press jk fast to enter
keymap("i", "yi", "<ESC>", opts)
keymap("i", "<C-s>", "<Esc>:w<cr>a", opts)

-- -- Visual --
-- -- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- -- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- -- Visual Block --
-- -- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- -- Terminal --
-- -- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Tree
keymap("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
keymap("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
keymap("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
keymap("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
keymap("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
keymap("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })

-- -- Hop
keymap("n", "<leader>hh", ":HopWord<cr>", opts)
keymap("n", "<leader>hl", ":HopWordCurrentLine<cr>", opts)
keymap("n", "<leader>ha", ":HopAnywhere<cr>", opts)
 
-- ToggleTerminal
keymap("n", "<leader>r",":ToggleTermSendCurrentLine<cr>", opts)
keymap("v", "<leader>r",":'<,'>ToggleTermSendVisualSelect<cr>", opts)
keymap("n", "<leader>tj", ":ToggleTerm size=60 direction=vertical<cr>", opts)
keymap("n", "<leader>tg",":lua _LAZYGIT_TOGGLE()<cr>",opts) 


