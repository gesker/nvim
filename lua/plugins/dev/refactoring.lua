return {
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {},
		config = function(_, opts)
			require("refactoring").setup(opts)
			require("telescope").load_extension("refactoring")
		end,
    -- stylua: ignore
    keys = {
      { "<leader>cF", function() require("telescope").extensions.refactoring.refactors() end, mode = { "v" }, desc = "Refactor", },
      { "<leader>rr", function() require('refactoring').select_refactor() end, mode = { "v" }, desc = "Refactor Extract Function", },
      { "<leader>re", function() require('refactoring').refactor('Extract Function') end, mode = { "v" }, desc = "Refactor Extract Function", },
      { "<leader>ref", function() require('refactoring').refactor('Extract Function To File') end, mode = { "v" }, desc = "Refactor Extract Function To File", },
      { "<leader>rv", function() require('refactoring').refactor('Extract Variable') end, mode = { "v" }, desc = "Refactor Extract Variable", },
      { "<leader>ri", function() require('refactoring').refactor('Inline Variable') end, mode = { "v" }, desc = "Refactor Inline Variable", },
      { "<leader>ri", function() require('refactoring').refactor('Inline Variable') end, mode = { "n" }, desc = "Refactor Inline Variable", },
      { "<leader>rb", function() require('refactoring').refactor('Extract Block') end, mode = { "v" }, desc = "Refactor Extract Block", },
      { "<leader>rbf", function() require('refactoring').refactor('Extract Block To File') end, mode = { "v" }, desc = "Refactor Extract Block To File", },

    },
	},
}
