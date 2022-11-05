local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      },
    },
  },
})

telescope.load_extension('fzf')
