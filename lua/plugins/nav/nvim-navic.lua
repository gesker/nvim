-- Sort of like bread crumbs
return {
	{
		"SmiteshP/nvim-navic",
		name = "nvim-navic",
		dependencies = { "neovim/nvim-lspconfig" },
		-- event = { "BufRead", "BufNew" },
		event = { "VeryLazy", },
		config = function()
			require("nvim-navic").setup()
		end,
	},
}
