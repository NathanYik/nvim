local fn = vim.fn

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
  print "Installing Packer, please close and reopen Neovim."
  vim.cmd [[packadd packer.nvim]]
end

local packer_user_config_group = vim.api.nvim_create_augroup("packer_user_config", {})
vim.api.nvim_create_autocmd("BufWritePost",
  { pattern= "plugins.lua", command = "source <afile> | PackerSync", group = packer_user_config_group })

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  use "github/copilot.vim"
  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim"
  use "nvim-lua/popup.nvim"
  use "tpope/vim-surround"
  use "tpope/vim-repeat"
  use "windwp/nvim-autopairs"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ':TSUpdate' }
  use {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.0'
  }
  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "numToStr/Comment.nvim"
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "neovim/nvim-lspconfig"
  use "jose-elias-alvarez/null-ls.nvim"
  use "mfussenegger/nvim-dap"
  use "RRethy/vim-illuminate"
  use "doums/darcula"
  use "folke/tokyonight.nvim"
  use "mg979/vim-visual-multi"
  use "lewis6991/gitsigns.nvim"
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
