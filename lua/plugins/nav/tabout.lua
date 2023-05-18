return {
	"abecodes/tabout.nvim",
	-- event = "VeryLazy",
	event = "LspAttach",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"hrsh7th/nvim-cmp",
	},
	config = true,
}
