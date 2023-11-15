local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "plugins.lua",
	command = "source <afile> | Lazy sync",
	group = vim.api.nvim_create_augroup("packer_user_config", {}),
})

require("lazy").setup({
	"github/copilot.vim",
	"folke/tokyonight.nvim",
	"nvim-lua/plenary.nvim",
	"nvim-lua/popup.nvim",
	"kylechui/nvim-surround",
	"tpope/vim-fugitive",
	"windwp/nvim-autopairs",
	"windwp/nvim-ts-autotag",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",
	{
		"nvim-treesitter/nvim-treesitter",
		-- commit = "e53950f646b0c11624280ee7c4eff97a9e0904f1",
		build = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.0",
	},
	"nvim-treesitter/nvim-treesitter-textobjects",
	"nvim-treesitter/nvim-treesitter-context",
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	"JoosepAlviste/nvim-ts-context-commentstring",
	"numToStr/Comment.nvim",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"jose-elias-alvarez/null-ls.nvim",
	"mfussenegger/nvim-dap",
	"rcarriga/nvim-dap-ui",
	"mxsdev/nvim-dap-vscode-js",
	"RRethy/vim-illuminate",
	"mg979/vim-visual-multi",
	"lewis6991/gitsigns.nvim",
	"kyazdani42/nvim-web-devicons",
	{ "sindrets/diffview.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	"kyazdani42/nvim-tree.lua",
	"akinsho/bufferline.nvim",
	"akinsho/nvim-toggleterm.lua",
	"nvim-lualine/lualine.nvim",
	"moll/vim-bbye",
	"ahmedkhalf/project.nvim",
	"jose-elias-alvarez/typescript.nvim",
	"lukas-reineke/indent-blankline.nvim",
	"kevinhwang91/nvim-hlslens",
	{ "kevinhwang91/nvim-ufo", dependencies = { "kevinhwang91/promise-async" } },
	"petertriho/nvim-scrollbar",
	"ThePrimeagen/refactoring.nvim",
	{
		"nvim-neotest/neotest",
		dependencies = { "haydenmeade/neotest-jest", "olimorris/neotest-rspec", "marilari88/neotest-vitest" },
	},
})
