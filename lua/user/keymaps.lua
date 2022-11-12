local opts = { noremap = true, silent = true }

local map = vim.keymap.set

local builtin = require("telescope.builtin")
local nt_api = require("nvim-tree.api")
local buffline = require("bufferline")
local terminal = require("toggleterm.terminal").Terminal
local dap = require("dap")
local dapui = require("dapui")

map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

map("n", "<leader>e", nt_api.tree.toggle, opts)

map("n", "<A-Up>", ":resize -2<CR>", opts)
map("n", "<A-Down>", ":resize +2<CR>", opts)
map("n", "<A-Left>", ":vertical resize -2<CR>", opts)
map("n", "<A-Right>", ":vertical resize +2<CR>", opts)

map("n", "<A-l>", ":bnext<CR>", opts)
map("n", "<A-h>", ":bprevious<CR>", opts)

map("i", "jk", "<ESC>", opts)

map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

map({ "n", "v" }, "<A-k>", ":m .-2<CR>==", opts)
map({ "n", "v" }, "<A-j>", ":m .+1<CR>==", opts)
map("v", "p", '"_dP', opts)

map("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
map("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

map("n", "<leader>gg", function()
	terminal:new({ cmd = "lazygit", hidden = true }):toggle()
end, opts)

map("n", "<leader>ff", builtin.find_files, opts)
map("n", "<leader>fg", builtin.live_grep, opts)
map("n", "<leader>fb", builtin.buffers, opts)
map("n", "<leader>fh", builtin.help_tags, opts)
map("n", "<leader>fp", require("telescope").extensions.projects.projects, opts)

map("n", "<leader>1", function()
	buffline.go_to(1)
end, opts)
map("n", "<leader>2", function()
	buffline.go_to(2)
end, opts)
map("n", "<leader>3", function()
	buffline.go_to(3)
end, opts)
map("n", "<leader>4", function()
	buffline.go_to(4)
end, opts)
map("n", "<leader>5", function()
	buffline.go_to(5)
end, opts)
map("n", "<leader>6", function()
	buffline.go_to(6)
end, opts)
map("n", "<leader>7", function()
	buffline.go_to(7)
end, opts)
map("n", "<leader>8", function()
	buffline.go_to(8)
end, opts)
map("n", "<leader>9", function()
	buffline.go_to(9)
end, opts)
map("n", "<leader>$", function()
	buffline.go_to(-1)
end, opts)
map("n", "<leader>bcc", "<cmd>Bdelete<CR>", opts)
map("n", "<leader>bcl", function()
	buffline.close_in_direction("left")
end, opts)
map("n", "<leader>bcr", function()
	buffline.close_in_direction("right")
end, opts)
map("n", "<leader>bca", function()
	for _, e in ipairs(buffline.get_elements().elements) do
		vim.schedule(function()
			vim.cmd("bd " .. e.id)
		end)
	end
end, opts)

--[[ map("n", "<Leader>db", "<CMD>lua require('dap').toggle_breakpoint()<CR>", opts) ]]
--[[ map("n", "<Leader>dc", "<CMD>lua require('dap').continue()<CR>", opts) ]]
--[[ map("n", "<Leader>dd", "<CMD>lua require('dap').continue()<CR>", opts) ]]
--[[ map("n", "<Leader>dh", "<CMD>lua require('dapui').eval()<CR>", opts) ]]
--[[ map("n", "<Leader>di", "<CMD>lua require('dap').step_into()<CR>", opts) ]]
--[[ map("n", "<Leader>do", "<CMD>lua require('dap').step_out()<CR>", opts) ]]
--[[ map("n", "<Leader>dO", "<CMD>lua require('dap').step_over()<CR>", opts) ]]
--[[ map("n", "<Leader>dt", "<CMD>lua require('dap').terminate()<CR>", opts) ]]

map("n", "<Leader>db", dap.toggle_breakpoint, opts)
map("n", "<Leader>dc", dap.continue, opts)
map("n", "<Leader>dh", dapui.eval, opts)
map("n", "<Leader>di", dap.step_into, opts)
map("n", "<Leader>do", dap.step_out, opts)
map("n", "<Leader>dO", dap.step_over, opts)
