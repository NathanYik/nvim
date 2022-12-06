local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
--[[ local diagnostics = null_ls.builtins.diagnostics ]]
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	sources = {
		--[[ diagnostics.eslint_d, ]]
		require("typescript.extensions.null-ls.code-actions"),
		code_actions.gitsigns,
		formatting.stylua,
		formatting.prettierd.with({
			extra_args = { "--no-semi", "--single-quote" },
		}),
		-- formatting.prettier.with({
		-- 	extra_args = { "--no-semi", "--single-quote" },
		-- }),
	},
})
