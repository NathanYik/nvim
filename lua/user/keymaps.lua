local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local map = vim.keymap.set

local builtin = require("telescope.builtin")
local nt_api = require("nvim-tree.api")
local bufferline = require("bufferline")

map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)


map("n", "<leader>e", nt_api.tree.toggle, opts)


map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)


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


map("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
map("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
map("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
map("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)


map("n", "<leader>ff", function() builtin.find_files(require('telescope.themes').get_dropdown({ previewer = false })) end
  , opts)
map("n", "<leader>fg", function() builtin.live_grep(require('telescope.themes').get_dropdown({})) end, opts)
map("n", "<leader>fb", function() builtin.buffers(require('telescope.themes').get_dropdown({ previewer = false })) end,
  opts)
map("n", "<leader>fh", function() builtin.help_tags(require('telescope.themes').get_dropdown({})) end, opts)


map("n", "<leader>1", function() bufferline.go_to(1) end, opts)
map("n", "<leader>2", function() bufferline.go_to(2) end, opts)
map("n", "<leader>3", function() bufferline.go_to(3) end, opts)
map("n", "<leader>4", function() bufferline.go_to(4) end, opts)
map("n", "<leader>5", function() bufferline.go_to(5) end, opts)
map("n", "<leader>6", function() bufferline.go_to(6) end, opts)
map("n", "<leader>7", function() bufferline.go_to(7) end, opts)
map("n", "<leader>8", function() bufferline.go_to(8) end, opts)
map("n", "<leader>9", function() bufferline.go_to(9) end, opts)
map("n", "<leader>$", function() bufferline.go_to(-1) end, opts)
map("n", "<leader>bcc", '<cmd>Bdelete<CR>', opts)
map("n", "<leader>bcl", function() bufferline.close_in_direction('left') end, opts)
map("n", "<leader>bcr", function() bufferline.close_in_direction('right') end, opts)
--map("n", "<leader>bcr", bufferline.close_right, opts)
map("n", "<leader>bca", function()
  for _, e in ipairs(bufferline.get_elements().elements) do
    vim.schedule(function()
      vim.cmd("bd " .. e.id)
    end)
  end
end, opts)




