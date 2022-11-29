local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing Packer, please close and reopen Neovim.")
	vim.cmd([[packadd packer.nvim]])
end

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "plugins.lua",
	command = "source <afile> | PackerSync",
	group = vim.api.nvim_create_augroup("packer_user_config", {}),
})

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	use("github/copilot.vim")
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")
	use("tpope/vim-surround")
	use("tpope/vim-repeat")
	use("tpope/vim-fugitive")
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")
	use({
		"nvim-treesitter/nvim-treesitter",
		commit = "e53950f646b0c11624280ee7c4eff97a9e0904f1",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
	})
	use({ "nvim-treesitter/nvim-treesitter-textobjects", requires = { "nvim-treesitter/nvim-treesitter" } })
	use({ "nvim-treesitter/nvim-treesitter-context", requires = { "nvim-treesitter/nvim-treesitter" } })
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("numToStr/Comment.nvim")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")
	use("jose-elias-alvarez/null-ls.nvim")
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("RRethy/vim-illuminate")
	use("doums/darcula")
	use("folke/tokyonight.nvim")
	use("mg979/vim-visual-multi")
	use("lewis6991/gitsigns.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")
	use("akinsho/bufferline.nvim")
	use("akinsho/nvim-toggleterm.lua")
	use("nvim-lualine/lualine.nvim")
	use("moll/vim-bbye")
	use("ahmedkhalf/project.nvim")
	use("lewis6991/impatient.nvim")
	use("jose-elias-alvarez/typescript.nvim")
	use({ "nvim-neotest/neotest", requires = { "haydenmeade/neotest-jest", "olimorris/neotest-rspec" } })

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
