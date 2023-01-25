require("toggleterm").setup({
	size = function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "float" then
			return 40
		end
	end,
	open_mapping = [[<leader>w]],
	hide_numbers = true,
	insert_mappings = false,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 1,
	start_in_insert = true,
	persist_size = true,
	direction = "horizontal",
	float_opts = {
		border = "curved",
		width = 120,
	},
	close_on_exit = true,
	shell = vim.o.shell,
})

function _G.set_terminal_keymaps()
	local opts = { buffer = 0, noremap = true }
	local map = vim.keymap.set
	-- map("t", "<esc>", [[<C-\><C-n>]], opts)
	map("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	map("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	map("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	map("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local terminal = require("toggleterm.terminal").Terminal
local lazygit = terminal:new({ cmd = "lazygit", hidden = true, direction = "tab", count = 5 })

function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end
