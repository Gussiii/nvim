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
  use 'karb94/neoscroll.nvim' --Smooth Scrolling
  use 'sheerun/vim-polyglot'

--Windows
  use 'wesQ3/vim-windowswap'
  use 'yamatsum/nvim-cursorline'

--Side bar
  use 'GustavoKatel/sidebar.nvim'

-- Status Line
  use 'hoob3rt/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'

-- Language Server Protocol
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'folke/trouble.nvim'
  use 'onsails/lspkind-nvim'
  use 'creativenull/diagnosticls-configs-nvim'
  use 'vim-scripts/AutoComplPop'

-- File Management
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', cmd = 'make' }
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'sudormrfbin/cheatsheet.nvim'
  use 'kyazdani42/nvim-tree.lua'
  use 'ThePrimeagen/harpoon'

-- Bufferline
  use 'dstein64/vim-startuptime'
  use 'akinsho/nvim-bufferline.lua'
  use 'windwp/nvim-autopairs'
  use 'miyakogi/conoline.vim'

-- Suggest 
  use {'gelguy/wilder.nvim', cmd=':UpdateRemotePlugins' }
  use 'stevearc/dressing.nvim'
  --use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

-- Markdown Files
  use 'godlygeek/tabular'
  use 'tpope/vim-markdown'
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

--
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)



