return {
	{
		"lukas-reineke/indent-blankline.nvim",
		name = "indent-blankline",
		-- event = { "BufReadPre", "BufNew" },
		event = { "VeryLazy" },
		config = function()
			require("indent_blankline").setup({
				show_end_of_line = true,
				show_current_context = true,
				show_current_context_start = true,
				-- char_highlight_list = {
				-- "IndentBlanklineIndent0",
				-- "IndentBlanklineIndent1",
				-- "IndentBlanklineIndent2",
				-- "IndentBlanklineIndent3",
				-- "IndentBlanklineIndent4",
				-- "IndentBlanklineIndent5",
				-- "IndentBlanklineIndent6",
				-- "IndentBlanklineIndent7",
				-- "IndentBlanklineIndent8",
				-- "IndentBlanklineIndent9",
				-- },
			})
		end,
	},
}
