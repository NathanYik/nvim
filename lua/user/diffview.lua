vim.opt.fillchars:append({ diff = "╱" })

require("diffview.actions")
require("diffview").setup({
	enhanced_diff_hl = true,
})
