require("indent_blankline").setup({
	show_current_context = true,
})

vim.api.nvim_set_hl(0, "IndentBlanklineChar", { fg = "#393939" })
vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", { fg = "#565656" })
