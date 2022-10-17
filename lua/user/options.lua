local options = {
  backup = false,
  clipboard = "unnamedplus",
  cmdheight = 2,
  completeopt = { "menuone", "noselect" },
  conceallevel = 0,
  fileencoding = "utf-8",
  mouse = "a",
  pumheight = 10,
  showtabline = 2,
  hlsearch = true,
  ignorecase = true,
  smartcase = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  termguicolors = true,
  undofile = true,
  updatetime = 300,
  shiftwidth = 2,
  expandtab = true,
  tabstop = 2,
  number = true,
  wrap = true,
  scrolloff = 8,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
