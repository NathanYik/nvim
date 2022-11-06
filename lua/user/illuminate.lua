local status_ok, illuminate = pcall(require, "illuminate")
if not status_ok then
	return
end

vim.g.Illuminate_ftblacklist = { "NvimTree", "alpha" }
vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#363636" })
vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#363636" })
vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#363636" })

illuminate.configure({
	providers = {
		"lsp",
		"treesitter",
		"regex",
	},
	delay = 0,
	filetypes_denylist = {
		"dirvish",
		"fugitive",
		"NvimTree",
		"alpha",
		"packer",
		"neogitstatus",
		"Trouble",
		"lir",
		"Outline",
		"spectre_panel",
		"toggleterm",
		"TelescopePrompt",
		"DressingSelect",
	},
	filetypes_allowlist = {},
	modes_denylist = {},
	modes_allowlist = {},
	providers_regex_syntax_denylist = {},
	providers_regex_syntax_allowlist = {},
	under_cursor = true,
})
