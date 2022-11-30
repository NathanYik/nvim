local opts = { noremap = true, silent = true }

local map = vim.keymap.set

map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)

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

map("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)
map("n", "<leader>fp", "<cmd>Telescope projects<CR>", opts)

map("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>", opts)
map("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>", opts)
map("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>", opts)
map("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<CR>", opts)
map("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<CR>", opts)
map("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<CR>", opts)
map("n", "<leader>7", "<cmd>BufferLineGoToBuffer 7<CR>", opts)
map("n", "<leader>8", "<cmd>BufferLineGoToBuffer 8<CR>", opts)
map("n", "<leader>9", "<cmd>BufferLineGoToBuffer 9<CR>", opts)
map("n", "<leader>$", "<cmd>BufferLineGoToBuffer -1<CR>", opts)
map("n", "<leader>bcc", "<cmd>Bdelete<CR>", opts)
map("n", "<leader>bcl", "<cmd>BufferLineCloseLeft<CR>", opts)
map("n", "<leader>bcr", "<cmd>BufferLineCloseRight<CR>", opts)
map("n", "<leader>bca", function()
	for _, e in ipairs(require("bufferline").get_elements().elements) do
		vim.schedule(function()
			vim.cmd("bd " .. e.id)
		end)
	end
end, opts)

map("n", "<Leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>", opts)
map("n", "<Leader>dc", "<cmd>lua require('dap').continue()<CR>", opts)
map("n", "<Leader>dh", "<cmd>lua require('dapui').eval()<CR>", opts)
map("n", "<Leader>di", "<cmd>lua require('dap').step_into()<CR>", opts)
map("n", "<Leader>do", "<cmd>lua require('dap').step_out()<CR>", opts)
map("n", "<Leader>dO", "<cmd>lua require('dap').step_over()<CR>", opts)
map("n", "<Leader>dx", "<cmd>lua require('dap').terminate()<CR>", opts)

map("n", "<Leader>tt", "<cmd>lua require('neotest').run.run()<CR>", opts)
map("n", "<Leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", opts)
map("n", "<Leader>td", "<cmd>lua require('neotest').run.run({ strategy = 'dap' })<CR>", opts)
map("n", "<Leader>to", "<cmd>lua require('neotest').output.open()<CR>", opts)
map("n", "<Leader>tp", "<cmd>lua require('neotest').output_panel.toggle()<CR>", opts)
map("n", "<Leader>ts", "<cmd>lua require('neotest').summary.toggle()<CR>", opts)
