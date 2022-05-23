-- https://www.youtube.com/watch?v=gd_wapDL0V0
-- https://github.com/LunarVim/Neovim-from-scratch/tree/03-plugins
-- https://www.youtube.com/watch?v=NkfMBI1tVwY&t=234s Tutorial for plugin configuration

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]


-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- get the configuration file for each plugin
-- expects the name of the config file
function get_config(name)
	return string.format('require("config/%s")', name)
  end

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

--General
  use 'jiangmiao/auto-pairs' --auto colose []{}
  use 'preservim/nerdtree'  --File nav
  use 'tpope/vim-commentary' --Easy comment
  use 'hrsh7th/nvim-cmp' --Auto compleat
  -- use {'karb94/neoscroll.nvim', config=get_config("neoscroll")} --Smooth Scrolling
  -- use 'sheerun/vim-polyglot'

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer


  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

--Windows
  use 'wesQ3/vim-windowswap'
  use 'yamatsum/nvim-cursorline'

-- Status Line
  use {'hoob3rt/lualine.nvim', config=get_config("lualine")}
  use 'kyazdani42/nvim-web-devicons'


-- File Management
  use {'nvim-telescope/telescope.nvim', config=get_config('telescope')}
  use {'nvim-telescope/telescope-fzf-native.nvim', cmd = 'make' }
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'
  -- use 'sudormrfbin/cheatsheet.nvim'
  use 'kyazdani42/nvim-tree.lua'
  use 'ThePrimeagen/harpoon'

-- Bufferline
  use 'dstein64/vim-startuptime'
  use 'akinsho/nvim-bufferline.lua'
  use 'windwp/nvim-autopairs'
  use 'miyakogi/conoline.vim'

-- Markdown Files
  use 'godlygeek/tabular'
  use 'tpope/vim-markdown'
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

--Color
  use "lunarvim/colorschemes"
  use "folke/tokyonight.nvim"

-- Dashboard 
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = get_config('alpha')
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)



