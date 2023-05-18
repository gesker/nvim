return {
	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		-- event = "BufReadPost",
		event = "VeryLazy",
		config = function()
			require("treesitter-context").setup()
		end,
	},
}
