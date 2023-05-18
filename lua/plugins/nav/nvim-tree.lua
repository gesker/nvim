return {
	"nvim-tree/nvim-tree.lua",
	cmd = { "NvimTreeToggle" },
	keys = {
		{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer (NvimTree)" },
		{ "<leader>ee", "<cmd>NvimTreeFocus<cr>", desc = "Explorer Focus (NvimTree)" },
		{ "<leader>ef", "<cmd>NvimTreeFindFile<cr>", desc = "Explorer Find (NvimTree)" },
		{ "<leader>ec", "<cmd>NvimTreeClose<cr>", desc = "Explorer Close (NvimTree)" },
	},
	opts = {
		disable_netrw = true,
		hijack_netrw = true,
		respect_buf_cwd = true,
		view = {
			number = true,
			relativenumber = true,
		},
		filters = {
			-- custom = { ".git" },
			dotfiles = true,
		},
		sync_root_with_cwd = true,
		update_focused_file = {
			enable = true,
			update_root = true,
		},
		actions = {
			open_file = {
				quit_on_open = true,
			},
		},
	},
}
