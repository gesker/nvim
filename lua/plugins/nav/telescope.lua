return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"nvim-treesitter/nvim-treesitter",
			-- Make sure ripgrep and fd installed on OS
			"BurntSushi/ripgrep",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- fzf integration
			"nvim-telescope/telescope-file-browser.nvim", -- file explorer
			"nvim-telescope/telescope-frecency.nvim", -- recent files
			{ "kkharji/sqlite.lua", module = "sqlite" }, -- required by telescope-frecency.nvim and nvim-neoclip
			-- brew install chafa, ImageMagick, ripgrep, fd or fdfind, ffmpegthumbnailer, pdftoppm, epub-thumbnailer, fontpreview
			"nvim-telescope/telescope-media-files.nvim",
			"nvim-lua/popup.nvim", -- requred by telescope-media-files
			"TC72/telescope-tele-tabby.nvim", -- list tabs
			"AckslD/nvim-neoclip.lua", -- list clipboard history
			"ghassan0/telescope-glyph.nvim", -- requires nerdfonts
			"cljoly/telescope-repo.nvim", -- scans for git repos; requires plocate or locate installed
			"MaximilianLloyd/adjacent.nvim", -- list adjacent files
			"debugloop/telescope-undo.nvim",
			"kdheepak/lazygit.nvim",
      "princejoogie/dir-telescope.nvim",
		},
		event = { "TextYankPost" },
		cmd = { "Telescope" },
    -- stylua: ignore
    keys = {
      { "<leader><space>", "<cmd>lua require('telescope').extensions.frecency.frecency()<cr>", desc = "Telescope Find Files - Frequent" },
      { "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = "Telescope Find Files" },
      { "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", desc = "Telescope Live Grep" },
      { "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", desc = "Telescope Buffers" },
      { "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", desc = "Telescope Help Tags" },
      { "<leader>fgit", "<cmd>lua require('telescope.builtin').git_files()<cr>", desc = "Telescope Git Files" }, 
      { "<leader>fgc", "<cmd>lua require('telescope.builtin').git_commits()<cr>", desc = "Telescope Git Commits" },
      { "<leader>fgb", "<cmd>lua require('telescope.builtin').git_branches()<cr>", desc = "Telescope Git Branches" },
      { "<leader>fgs", "<cmd>lua require('telescope.builtin').git_status()<cr>", desc = "Telescope Git Status" },
      { "<leader>fe", "<cmd>lua require('telescope').extensions.file_browser.file_browser()<cr>", desc = "Telescope File Browser" },
      { "<leader>ft", "<cmd>lua require('telescope').extensions.tele_tabby.list()<cr>", desc = "Telescope Tab List" },
      { "<leader>fy", "<cmd>lua require('telescope').extensions.neoclip.neoclip()<cr>", desc = "Telescope Yank History List" },
      { "<leader>fl", "<cmd>lua require('telescope').extensions.glyph.glyph()<cr>", desc = "Telescope Glyphs" },
      { "<leader>fgr", "<cmd>lua require('telescope').extensions.repo.list{}<cr>", desc = "Telescope Git Repositories" },
      { "<leader>fa", "<cmd>lua require('telescope').extensions.adjacent.adjacent()<cr>", desc = "Telescope Adjacent Files" },
      { "<leader>fu", "<cmd>lua require('telescope').extensions.undo.undo()<cr>", desc = "Telescope Undo List" },
      { "<leader>flgit", "<cmd>lua require('telescope').extensions.lazygit.lazygit()<cr>", desc = "Telescope Call LazyGit" },
      { "<leader>ffd", "<cmd>lua require('telescope').extensions.dir.live_grep()<cr>", desc = "Telescope Directory Live Grep" },
      { "<leader>fdf", "<cmd>lua require('telescope').extensions.dir.find_files()<cr>", desc = "Telescope Directory Find Files" },
      { "<leader>faa", "<cmd>lua require('telescope').extensions.aerial.aerial()<cr>", desc = "Telescope Aerial" },
    },
		config = function(_, _)
			local telescope = require("telescope")
			--local icons = require("config.icons")
			local actions = require("telescope.actions")
			local actions_layout = require("telescope.actions.layout")
			local mappings = {
				i = {
					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
					["<C-n>"] = actions.cycle_history_next,
					["<C-p>"] = actions.cycle_history_prev,
					["?"] = actions_layout.toggle_preview,
				},
			}

			local opts = {
				defaults = {
					-- prompt_prefix = icons.ui.Telescope .. " ",
					-- selection_caret = icons.ui.Forward .. " ",
					mappings = mappings,
					border = {},
					borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
					color_devicons = true,
					dynamic_preview_title = true,
					file_ignore_patterns = {
            "target",
            "node_modules",
          },
				},
				pickers = {
					find_files = {
						theme = "dropdown",
						previewer = true,
						hidden = true,
						find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
					},
					git_files = {
						theme = "dropdown",
						previewer = true,
					},
					buffers = {
						theme = "dropdown",
						previewer = true,
					},
				},
				extensions = {
					dir = {
            hidden = true,
            no_ignore = false,
            show_preview = true,
					},
					fzf = {
						fuzzy = true, -- false will only do exact matchings
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case" -- default case_mode is "smart_case"
					},
					file_browser = {
						theme = "dropdown",
						previewer = true,
						hijack_netrw = true,
						mappings = mappings,
					},
					media_files = {
						filetypes = { "png", "webp", "jpg", "jpeg", "mp4", "webm", "pdf" },
						find_cmd = "rg",
					},
					tele_tabby = {
						use_highlighter = true,
					},
					glyph = {
						action = function(glyph)
							-- argument glyph is a table.
							-- {name="", value="", category="", description=""}
							vim.fn.setreg("*", glyph.value)
							print([[Press p or "*p to paste this glyph]] .. glyph.value)
							-- insert glyph when picked
							-- vim.api.nvim_put({ glyph.value }, 'c', false, true)
						end,
					},
					repo = {
						list = {
							fd_opts = {
								"--no-ignore-vcs",
							},
							search_dirs = {
								"~/Development",
							 },
						},
					},
					undo = {
						use_delta = true,
						use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo '$DIFF' | delta" }
						side_by_side = false,
						diff_context_lines = vim.o.scrolloff,
						entry_format = "state #$ID, $STAT, $TIME",
						mappings = {
							i = {
								["<cr>"] = require("telescope-undo.actions").yank_additions,
								["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
								["<C-cr>"] = require("telescope-undo.actions").restore,
							},
						},
					},
				},
			}

			local neoclip_opts = {
				history = 2048,
				enable_persistent_history = true,
			}

			telescope.setup(opts)
			telescope.load_extension("fzf")
			telescope.load_extension("file_browser")
			-- telescope.load_extension("dap")
			telescope.load_extension("frecency")
			telescope.load_extension("media_files")
			telescope.load_extension("tele_tabby")
			require("neoclip").setup(neoclip_opts)
			telescope.load_extension("glyph")
			telescope.load_extension("repo")
			telescope.load_extension("undo")
			telescope.load_extension("lazygit")
			telescope.load_extension("dir")
telescope.load_extension('aerial')
		end,
	},
}
