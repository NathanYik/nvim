local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	cmd = { "nvim" },
	debug = true,
	sources = {
		formatting.stylua,
		diagnostics.eslint_d,
		formatting.prettierd.with({
			extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
		}),
	},
})
