-- fast naviation
return {
	{
		"phaazon/hop.nvim",
		branch = "v2",
		-- event = "VeryLazy",
		keys = {
			{ "<leader>hw", ":HopWord<CR>", desc = "HopWord" },
			{ "<leader>hl", ":HopLine<CR>", desc = "HopLine" },
			{ "<leader>hw", ":HopWord<CR>", desc = "HopWord" },
			{ "<leader>hl", ":HopLine<CR>", desc = "HopLine" },
		},
		config = true,
	},
}
