local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<esc>"] = actions.close,
			},
		},
    prompt_prefix = "🔍 ",
    selection_caret = " ",
    multi_icon = " ",
    sorting_strategy = "ascending",
    path_display = { "smart" },
	},
	pickers = {
		find_files = {
			theme = "dropdown",
			previewer = false,
      layout_config = {
        anchor = "N",
      },
		},
		live_grep = {
			theme = "dropdown",
      layout_config = {
        mirror = true,
        anchor = "N",
      },
		},
		buffers = {
			theme = "dropdown",
			previewer = false,
      layout_config = {
        anchor = "N",
      },
		},
		help_tags = {
			theme = "dropdown",
      layout_config = {
        mirror = true,
        anchor = "N",
      },
		},
	},
  extensions = {
    projects = {
			theme = "dropdown",
      layout_config = {
        mirror = true,
        anchor = "N",
      },
    }
  }
})

telescope.load_extension("fzf")
telescope.load_extension("projects")
