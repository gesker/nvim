-- Icons make sure nerdfont installed
return {
	{
		"nvim-tree/nvim-web-devicons",
		name = "devicons",
    event = "VeryLazy",
		config = function()
			require("nvim-web-devicons").setup()
		end,
	},
}
