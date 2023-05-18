-- Sort of like bread crumbs
return {
	{
		"SmiteshP/nvim-navbuddy",
		name = "nvim-navbuddy",
		dependencies = {
			"neovim/nvim-lspconfig",
			"SmiteshP/nvim-navic",
			"MunifTanjim/nui.nvim",
			"numToStr/Comment.nvim",
			"nvim-telescope/telescope.nvim",
		},
		-- event = { "BufRead", "BufNew" },
		event = { "VeryLazy" },
		config = function()
			require("nvim-navbuddy").setup()
		end,
	},
}
