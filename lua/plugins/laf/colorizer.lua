-- Display Color on HexCodes
return {
	{
		"norcalli/nvim-colorizer.lua",
		cmd = { "ColorizeToggle" },
		config = function()
			require("colorizer").setup()
		end,
	},
}
