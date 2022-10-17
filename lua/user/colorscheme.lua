local colorscheme = "darcula"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("Unable to load colorscheme: " .. colorscheme, vim.log.levels.ERROR)
end
