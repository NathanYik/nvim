local rainbow_delimiters = require("rainbow-delimiters")

vim.api.nvim_set_hl(0, "BracketYellow", { fg = "#FFD700" })
vim.api.nvim_set_hl(0, "BracketPurple", { fg = "#DA70D6" })
vim.api.nvim_set_hl(0, "BracketBlue", { fg = "#1A9FFF" })

require("rainbow-delimiters.setup").setup({
	strategy = {
		[""] = rainbow_delimiters.strategy["global"],
		commonlisp = rainbow_delimiters.strategy["local"],
	},
	query = {
		[""] = "rainbow-delimiters",
		tsx = "rainbow-parens",
		typescript = "rainbow-parens",
		javascript = "rainbow-delimiters-react",
	},
	highlight = {
		"BracketYellow",
		"BracketPurple",
		"BracketBlue",
	},
})
