local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "n", [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], opts)
map("n", "N", [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], opts)
map("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], opts)
map("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], opts)
map("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], opts)
map("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], opts)

map("n", "<Leader>l", "<Cmd>noh<CR>", opts)

require("scrollbar").setup({
	throttle_ms = 0,
	show_in_active_only = true,
	marks = {
		GitAdd = { text = "▁" },
		GitChange = { text = "▁" },
	},
	handlers = {
		cursor = false,
	},
})
require("scrollbar.handlers.search").setup({
	calm_down = true,
	nearest_only = true,
})
require("scrollbar.handlers.gitsigns").setup()
