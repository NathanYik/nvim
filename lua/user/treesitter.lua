require('nvim-treesitter')
require('nvim-treesitter.configs').setup({
  ensure_installed = "all",
  highlight = {
    enable = true,
    -- additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  autopairs = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
})
