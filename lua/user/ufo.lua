local map = vim.keymap.set
local opts = { noremap = true, silent = true }

require("ufo").setup({
	open_fold_hl_timeout = 0,
	provider_selector = function(bufnr, filetype, buftype)
		return { "treesitter", "indent" }
	end,
})

map("n", "zR", require("ufo").openAllFolds, opts)
map("n", "zM", require("ufo").closeAllFolds, opts)
