return {
	-- ONLY USE NULL-LS FOR FORMATTING !!!!
	-- LSP for Diagnotics, etc.
	"jose-elias-alvarez/null-ls.nvim",
	-- event = { "BufReadPre", "BufNewFile" },
	event = { "VeryLazy" },
	-- ft = {"java", "lua", "sql", "bash", "sh", "xml", "json"},
	dependencies = { "mason.nvim" },
	opts = function()
		local null_ls = require("null-ls")
		return {
			root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
			sources = {
				null_ls.builtins.formatting.beautysh,
				null_ls.builtins.formatting.buf,
				null_ls.builtins.formatting.fixjson,
				null_ls.builtins.formatting.google_java_format,
				null_ls.builtins.formatting.htmlbeautifier,
				null_ls.builtins.formatting.jq,
				null_ls.builtins.formatting.lua_format,
				null_ls.builtins.formatting.markdown_toc,
				null_ls.builtins.formatting.markdownlint,
				null_ls.builtins.formatting.eslint,
				null_ls.builtins.formatting.nginx_beautifier,
				null_ls.builtins.formatting.pg_format,
				null_ls.builtins.formatting.prettier_eslint,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.protolint,
				null_ls.builtins.formatting.rustfmt,
				null_ls.builtins.formatting.shfmt,
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.terraform_fmt,
				null_ls.builtins.formatting.trim_newlines,
				null_ls.builtins.formatting.trim_whitespace,
        null_ls.builtins.formatting.xmlformat,
        null_ls.builtins.formatting.yamlfix,
			},
		}
	end,
}
