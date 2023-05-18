return {
	{
		"andymass/vim-matchup",
		dependencies = { "nvim-lua/popup.nvim" },
		-- event = { "BufReadPost" },
		event = { "VeryLazy" },
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,
	},
}
