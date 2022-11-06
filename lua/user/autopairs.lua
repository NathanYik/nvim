require("nvim-autopairs").setup({
	check_ts = true,
	enable_check_bracket_line = true,
	ignored_next_char = "[%w%.]",
	fast_wrap = {},
	ts_config = {
		lua = { "string" },
		javascript = { "template_string" },
		java = false,
	},
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
