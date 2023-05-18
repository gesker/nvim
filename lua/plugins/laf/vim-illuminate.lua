return {
	{
		"RRethy/vim-illuminate",
		-- event = "BufReadPost",
		event = "LspAttach",
		opts = {
			delay = 100,
			providers = {
				"treesitter",
				"lsp",
				"regex",
			},
		},
		config = function(_, opts)
			require("illuminate").configure(opts)
		end,
	},
}
