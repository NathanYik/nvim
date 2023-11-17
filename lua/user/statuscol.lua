local builtin = require("statuscol.builtin")
require("statuscol").setup({
	segments = {
		{
			sign = {
				name = { "neotest", "Dap" },
				maxWidth = 1,
				colWidth = 2,
				auto = false,
			},
			click = "v:lua.ScSa",
		},
		{
			sign = { name = { "Diagnostic" }, maxWidth = 2, auto = false },
			click = "v:lua.ScSa",
		},
		{
			text = { builtin.lnumfunc },
			click = "v:lua.ScLa",
		},
		{
			sign = {
				namespace = { " ", "gitsigns", " " },
				maxWidth = 1,
				colWidth = 1,
				auto = false,
			},
			click = "v:lua.ScSa",
		},
		{
			text = { builtin.foldfunc, " " },
			click = "v:lua.ScFa",
		},
	},
	ft_ignore = { "toggleterm" },
	bt_ignore = { "nofile" },
})
