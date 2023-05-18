return {
  {
    "glepnir/lspsaga.nvim",
    name = "lspsaga",
    dependencies = {
      {"nvim-tree/nvim-web-devicons"},
      -- {"nvim-treesitter/nvim-treesitter"}
    },
    event = "LspAttach",
    config = true,
  },
}
