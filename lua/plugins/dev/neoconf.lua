return {
	{
		"folke/neodev.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		event = { "VeryLazy" },
		config = true,
	},
}
