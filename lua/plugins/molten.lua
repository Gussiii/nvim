-- export DYLD_LIBRARY_PATH="$(brew --prefix)/lib:$DYLD_LIBRARY_PATH"
return  {
    {
      "bluz71/vim-moonfly-colors",
      lazy = false,
      priority = 1000,
      config = function()
        vim.cmd.syntax("enable")
        vim.cmd.colorscheme("moonfly")
  
        vim.api.nvim_set_hl(0, "MoltenOutputBorder", { link = "Normal" })
        vim.api.nvim_set_hl(0, "MoltenOutputBorderFail", { link = "MoonflyCrimson" })
        vim.api.nvim_set_hl(0, "MoltenOutputBorderSuccess", { link = "MoonflyBlue" })

      end,
    },
    {
      "benlubas/molten-nvim",
      dependencies = { "3rd/image.nvim" },
      build = ":UpdateRemotePlugins",
      init = function()
        vim.g.molten_image_provider = "image.nvim"
        vim.g.molten_use_border_highlights = true
        -- add a few new things
  
        -- don't change the mappings (unless it's related to your bug)
        vim.keymap.set("n", "<localleader>mi", ":MoltenInit<CR>")
        vim.keymap.set("n", "<localleader>e", ":MoltenEvaluateOperator<CR>")
        vim.keymap.set("n", "<localleader>rr", ":MoltenReevaluateCell<CR>")
        vim.keymap.set("v", "<localleader>r", ":<C-u>MoltenEvaluateVisual<CR>gv")
        vim.keymap.set("n", "<localleader>os", ":noautocmd MoltenEnterOutput<CR>")
        vim.keymap.set("n", "<localleader>oh", ":MoltenHideOutput<CR>")
        vim.keymap.set("n", "<localleader>md", ":MoltenDelete<CR>")
      end,
              

  
    },
    {
      "vhyrro/luarocks.nvim",
      priority = 1001, -- this plugin needs to run before anything else
      config = true, 
      opts = {
          rocks = { "magick" },
      },
  },
  {
      "3rd/image.nvim",
      dependencies = { "luarocks.nvim" },
      opts = {
        backend = "kitty",
        integrations = {},
        max_width = 100,
        max_height = 12,
        max_height_window_percentage = math.huge,
        max_width_window_percentage = math.huge,
        window_overlap_clear_enabled = true,
        window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
      },
      -- version = "1.1.0", -- or comment out for latest
    },
    -- {
    --   "nvim-treesitter/nvim-treesitter",
    --   build = ":TSUpdate",
    --   config = function()
    --     require("nvim-treesitter.configs").setup({
    --       ensure_installed = {
    --         "markdown",
    --         "markdown_inline",
    --         "python",
    --       },
    --       highlight = {
    --         enable = true,
    --         additional_vim_regex_highlighing = false,
    --       },
    --     })
    --   end,
    -- },
    
  }