-- stylua: ignore
return {
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog", },
		config = function()
			require("mason").setup({
				ensure_installed = {
					"ansiblels",
					"bashls",
					"bufls",
					"docker_compose_language_server",
					"dockerls",
					"gradle_ls",
					"graphql",
					"helm_ls",
					"jdtls",
					"lua_ls",
					"rust_analyzer",
					"tsserver",
          "cssls",
          "html",
          "jsonls",
          "lemminx",
          "marksman",
          "prettier",
          "proselint",
          "quick_lint_js",
          "sqlls",
          "yamlls",
				},
        pip = {
        upgrade_pip = true,
        install_args = {},
        },
			})
		end,
	},
  {
		"williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", } ,
		cmd = { "LspInstall", "LspUninstall", },
		config = function()
			require("mason-lspconfig").setup({
			  ensure_installed = {
					"ansiblels",
					"bashls",
					"bufls",
					"dockerls",
					"gradle_ls",
					"graphql",
					"helm_ls",
					"jdtls", -- java
					"lua_ls",
					"rust_analyzer",
					"tsserver",
          "cssls",
          "html",
          "jsonls",
          "jsonnet_ls",
          "lemminx", -- xml
          "marksman",
          "quick_lint_js", -- javascript
          "sqlls",
          "yamlls",
				},	
        automatic_installation = true,
			})
		end,
	},
  {
		"jay-babu/mason-nvim-dap.nvim",
    dependencies = { "williamboman/mason.nvim", } ,
		cmd = { "DapInstall", "DapUninstall", },
		config = function()
			require("mason-nvim-dap").setup({
			  ensure_installed = {
					"bash",
					"javadbg",
					"javatest",
				},	
        automatic_installation = true,
			})
		end,
	},
}
