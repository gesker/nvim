return {
	{
		"hrsh7th/nvim-cmp",
		-- event = "InsertEnter",
		ft = { "java", "lua", "sql", "bash", "sh", "xml", "json" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"uga-rosa/cmp-dictionary",
			"hrsh7th/cmp-copilot",
			"github/copilot.vim",
			"zbirenbaum/copilot.lua",
			"zbirenbaum/copilot-cmp",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local neogen = require("neogen")
			local icons = require("core.icons")

			local has_words_before = function()
				if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
					return false
				end
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
			end

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<Tab>"] = vim.schedule_wrap(function(fallback)
						if cmp.visible() and has_words_before() then
							cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
						else
							fallback()
						end
					end),
				}),
				sources = cmp.config.sources({
					{ name = "copilot", group_index = 2 },
					{ name = "nvim_lsp_signature_help", group_index = 2 },
					{ name = "nvim_lsp", group_index = 2 },
					{ name = "luasnip", group_index = 2 },
					{ name = "buffer", group_index = 2 },
					{ name = "path", group_index = 2 },
					{ name = "cmdline", group_index = 2 },
					{ name = "dictionary", group_index = 2 },
				}),
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(entry, item)
						local mode = "symbol"
						local symbol_map = { copilot = "" }
						local max_width = 0
						local source_names = {
							copilot = "(Copilot)",
							nvim_lsp_signature_help = "(Signature)",
							nvim_lsp = "(LSP)",
							luasnip = "(Snippet)",
							buffer = "(Buffer)",
							path = "(Path)",
							cmdline = "(Command Line)",
							dictionary = "(Dictionary)",
						}
						local duplicates = {
							copilot = 1,
							nvim_lsp_signature_help = 0,
							nvim_lsp = 0,
							luasnip = 1,
							buffer = 1,
							path = 1,
							cmdline = 1,
							dictionary = 1,
						}
						local duplicates_default = 0
						if max_width ~= 0 and #item.abbr > max_width then
							item.abbr = string.sub(item.abbr, 1, max_width - 1) .. icons.ui.Ellipsis
						end
						item.kind = icons.kind[item.kind]
						item.menu = source_names[entry.source.name]
						item.dup = duplicates[entry.source.name] or duplicates_default
						return item
					end,
				},
				sorting = {
					priority_weight = 2,
					comparators = {
						require("copilot_cmp.comparators").prioritize,
						-- Below is the default comparitor list and order for nvim-cmp
						cmp.config.compare.offset,
						-- cmp.config.compare.scopes, --this is commented in nvim-cmp too
						cmp.config.compare.exact,
						cmp.config.compare.score,
						cmp.config.compare.recently_used,
						cmp.config.compare.locality,
						cmp.config.compare.kind,
						cmp.config.compare.sort_text,
						cmp.config.compare.length,
						cmp.config.compare.order,
					},
				},
			})

			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})

			-- Auto pairs
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
		opts = {
			history = true,
			delete_check_events = "TextChanged",
		},
	},
}
