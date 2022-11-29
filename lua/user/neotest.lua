require("neotest").setup({
	adapters = {
		require("neotest-jest"),
		require("neotest-rspec"),
		require("neotest-vitest"),
	},
})
