-- https://www.youtube.com/watch?v=gd_wapDL0V0
-- https://github.com/LunarVim/Neovim-from-scratch/tree/03-plugins
-- https://www.youtube.com/watch?v=NkfMBI1tVwY&t=234s Tutorial for plugin configuration

-- BOOTSTRAP the plugin manager `lazy.nvim`
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local lazyIsInstalled = vim.loop.fs_stat(lazypath)
if not lazyIsInstalled then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

--------------------------------------------------------------------------------
-- BASIC PYTHON-RELATED OPTIONS

-- The filetype-autocmd runs a function when opening a file with the filetype
-- "python". This method allows you to make filetype-specific configurations. In
-- there, you have to use `opt_local` instead of `opt` to limit the changes to
-- just that buffer. (As an alternative to using an autocmd, you can also put those
-- configurations into a file `/after/ftplugin/{filetype}.lua` in your
-- nvim-directory.)
vim.api.nvim_create_autocmd("FileType", {
	pattern = "python", -- filetype for which to run the autocmd
	callback = function()
		-- use pep8 standards
		vim.opt_local.expandtab = true
		vim.opt_local.shiftwidth = 4
		vim.opt_local.tabstop = 4
		vim.opt_local.softtabstop = 4

		-- folds based on indentation https://neovim.io/doc/user/fold.html#fold-indent
		-- if you are a heavy user of folds, consider using `nvim-ufo`
		vim.opt_local.foldmethod = "indent"

		-- automatically capitalize boolean values. Useful if you come from a
		-- different language, and lowercase them out of habit.
		vim.cmd.inoreabbrev("<buffer> true True")
		vim.cmd.inoreabbrev("<buffer> false False")

		-- in the same way, we can fix habits regarding comments or None
		vim.cmd.inoreabbrev("<buffer> -- #")
		vim.cmd.inoreabbrev("<buffer> null None")
		vim.cmd.inoreabbrev("<buffer> none None")
		vim.cmd.inoreabbrev("<buffer> nil None")
	end,
})

require("lazy").setup({ { import = "config" }, { import = "config.lsp" }}, {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})