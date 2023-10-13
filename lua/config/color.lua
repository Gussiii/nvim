return 	{
  "folke/tokyonight.nvim",
  -- ensure that the color scheme is loaded at the very beginning
  lazy = false,
  priority = 1000,
  -- enable the colorscheme
  config = function() vim.cmd.colorscheme("tokyonight") end,
}