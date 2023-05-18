return {
    -- Actual Copilot plugin
	{
		"github/copilot.vim",
		cmd = "Copilot auth",
		event = "InsertEnter",
	},
  -- Copilot community plugin``
	{
		"zbirenbaum/copilot.lua",
    dependencies = {"github/copilot.vim",},
		cmd = "Copilot",
		event = "VeryLazy",
		config = function()
			require("copilot").setup({})
		end,
	},
    -- Cmp Copilot Plugin 
	{
		"zbirenbaum/copilot-cmp",
    dependencies = {"zbirenbaum/copilot.lua",},
		event = "VeryLazy",
		config = function()
			require("copilot_cmp").setup()
		end,
	},

}
