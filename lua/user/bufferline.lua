local bufferline = require('bufferline')

bufferline.setup {
  options = {
    numbers = 'none',
    close_command = "Bdelete! %d",
    right_mouse_command = "Bdelete! %d",
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = true,
    diagnostics_indicator = function(_, _, diagnostics_dict, _)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " "
            or (e == "warning" and " " or "")
        s = s .. n .. sym
      end
      return s
    end,
    separator_style = "thin",
    hover = {
      enabled = true,
      delay = 0,
      reveal = { "close" }
    }
  },
}
