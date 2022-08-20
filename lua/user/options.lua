-- https://www.youtube.com/watch?v=hY5-Q6NxQgY
-- https://github.com/LunarVim/Neovim-from-scratch/tree/01-options

o = vim.opt
o.number = true
o.relativenumber = true
o.autoindent = true
o.tabstop = 4
o.shiftwidth = 4
o.smarttab = true
o.softtabstop = 4
-- o.mouse="a"
o.completeopt = { "menuone", "noselect" } -- mostly just for cmp
o.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
o.splitright = true -- force all vertical splits to go to the right of current window
o.undofile = true -- enable persistent undo
o.wrap = false -- display lines as one long line
o.hlsearch = true -- highlight all matches on previous search pattern
o.termguicolors = true, -- set term gui colors (most terminals support this)


-- Conditional Options for file types
vim.api.nvim_create_autocmd('FileType', {
		pattern = 'markdown',
		command = 'setlocal spell'
	})

vim.api.nvim_create_autocmd('FileType', {
	pattern = 'markdown',
	command = 'setlocal wrap'
})

vim.api.nvim_create_autocmd('FileType', {
	pattern = 'markdown',
	command = 'setlocal suffixesadd+=.md'
})
