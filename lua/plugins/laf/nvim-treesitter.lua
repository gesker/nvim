return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter/nvim-treesitter-refactor",
			"nvim-treesitter/playground",
			"JoosepAlviste/nvim-ts-context-commentstring",
			"HiPhish/nvim-ts-rainbow2",
			"theHamsta/nvim-treesitter-pairs",
			"RRethy/nvim-treesitter-endwise",
			"windwp/nvim-ts-autotag",
			"windwp/nvim-ts-autotag",
		},
		build = ":TSUpdate",
		-- event = "BufReadPost",
		event = "VeryLazy",
		config = function()
			require("nvim-treesitter.configs").setup({

				ensure_installed = {
					"bash",
					"css",
					"dockerfile",
					"html",
					"java",
					"javascript",
					"json",
					"jsonc",
					"lua",
					"markdown",
					"markdown_inline",
					"regex",
					"yaml",
				},
				ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
				highlight = {
					enable = true, -- false will disable the whole extension
					disable = { "css" }, -- list of language that will be disabled
				},
				indent = { enable = true, disable = { "python", "css" } },
				autopairs = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "gnn",
						node_incremental = "grn",
						scope_incremental = "grc",
						node_decremental = "grm",
					},
				},

				-- nvim-treesitter-textobjects
				textobjects = {
					select = {
						enable = true,
						lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["aa"] = "@parameter.outer",
							["ia"] = "@parameter.inner",
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
						},
					},
				},

				-- nvim-treesitter-refactor
				refactor = {
					highlight_definitions = {
						enable = true,
						clear_on_cursor_move = true,
					},
					highlight_current_scope = { enable = true },
					smart_rename = {
						enable = true,
						keymaps = { smart_rename = "grr" },
						navigation = {
							enable = true,
							keymaps = {
								goto_definition = "gnd",
								list_definitions = "gnD",
								list_definitions_toc = "gO",
								goto_next_usage = "<a-*>",
								goto_previous_usage = "<a-#>",
							},
						},
					},
				},

				-- nvim-treesitter/playground
				playground = {
					enable = true,
					disable = {},
					updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
					persist_queries = false, -- Whether the query persists across vim sessions
					keybindings = {
						toggle_query_editor = "o",
						toggle_hl_groups = "i",
						toggle_injected_languages = "t",
						toggle_anonymous_nodes = "a",
						toggle_language_display = "I",
						focus_language = "f",
						unfocus_language = "F",
						update = "R",
						goto_node = "<cr>",
						show_help = "?",
					},
				},

				-- JoosepAlviste/nvim-ts-context-commentstring
				context_commentstring = { enable = true },

				-- HiPhish/nvim-ts-rainbow2
				rainbow = {
					enable = true,
					-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
					extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
					max_file_lines = nil, -- Do not enable for files with more than n lines, int
					-- colors = {}, -- table of hex strings
					-- termcolors = {} -- table of colour name strings
					-- Which query to use for finding delimiters
					query = "rainbow-parens",
					-- Highlight the entire buffer all at once
					strategy = require("ts-rainbow.strategy.global"),
				},

				-- RRethy/nvim-treesitter-endwise
				endwise = { enable = true },

				-- theHamsta/nvim-treesitter-pairs
				pairs = {
					enable = true,
					disable = {},
					highlight_pair_events = {}, -- e.g. {"CursorMoved"}, -- when to highlight the pairs, use {} to deactivate highlighting
					highlight_self = false, -- whether to highlight also the part of the pair under cursor (or only the partner)
					goto_right_end = false, -- whether to go to the end of the right partner or the beginning
					fallback_cmd_normal = "call matchit#Match_wrapper('',1,'n')", -- What command to issue when we can't find a pair (e.g. "normal
					keymaps = {
						goto_partner = "<leader>%",
						delete_balanced = "X",
					},
					delete_balanced = {
						only_on_first_char = false, -- whether to trigger balanced delete when on first character of a pair
						fallback_cmd_normal = nil, -- fallback command when no pair found, can be nil
						longest_partner = false, -- whether to delete the longest or the shortest pair when multiple found.
					},
				},
				autotag = {
					enable = true,
					filetypes = {
						"html",
						"xhtml",
						"javascript",
						"typescript",
						"javascriptreact",
						"typescriptreact",
						"svelte",
						"vue",
						"tsx",
						"jsx",
						"rescript",
						"xml",
						"php",
						"markdown",
						"glimmer",
						"handlebars",
						"hbs",
					},
				},
			})
		end,
	},
}
