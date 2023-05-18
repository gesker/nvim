return {
	{
		"MunifTanjim/prettier.nvim",
		dependencies = { "neovim/nvim-lspconfig", "jose-elias-alvarez/null-ls.nvim" },
    event = "VeryLazy",
		config = function()
			require("prettier").setup({

				bin = "prettier", -- or `'prettierd'` (v0.22+)
				filetypes = {
					"css",
					"graphql",
					"html",
					"java",
					"javascript",
					"javascriptreact",
					"json",
					"less",
					"lua",
					"markdown",
					"scss",
					"typescript",
					"typescriptreact",
					"xhtml",
					"xml",
					"yaml",
				},
				cli_options = {
					arrow_parens = "always",
					bracket_spacing = true,
					bracket_same_line = false,
					embedded_language_formatting = "auto",
					end_of_line = "lf",
					html_whitespace_sensitivity = "css",
					-- jsx_bracket_same_line = false,
					jsx_single_quote = false,
					print_width = 80,
					prose_wrap = "preserve",
					quote_props = "as-needed",
					semi = true,
					single_attribute_per_line = false,
					single_quote = false,
					tab_width = 2,
					trailing_comma = "es5",
					use_tabs = false,
					vue_indent_script_and_style = false,
				},
				["null-ls"] = {
					condition = function()
						return prettier.config_exists({
							-- if `false`, skips checking `package.json` for `"prettier"` key
							check_package_json = true,
						})
					end,
					---@diagnostic disable-next-line: unused-local
					runtime_condition = function(params)
						-- return false to skip running prettier
						return true
					end,
					timeout = 5000,
				},
			})
		end,
	},
}
