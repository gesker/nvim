return {
	{
		"stevearc/aerial.nvim",
		name = "aerial",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{ "<leader>a", "<cmd>AerialToggle!<cr>", desc = "Aerial" },
		},
		config = true,
	},
}
