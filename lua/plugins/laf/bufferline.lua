-- Put labels on buffers
return {
	{
		"akinsho/bufferline.nvim",
		name = "bufferline",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		config = function()
			require("bufferline").setup()
		end,
	},
}
