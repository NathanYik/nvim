local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<esc>"] = actions.close,
			},
		},
	},
	pickers = {
		find_files = {
			theme = "dropdown",
			previewer = false,
		},
		live_grep = {
			theme = "dropdown",
		},
		buffers = {
			theme = "dropdown",
			previewer = false,
		},
		help_tags = {
			theme = "dropdown",
		},
	},
})

telescope.load_extension("fzf")
