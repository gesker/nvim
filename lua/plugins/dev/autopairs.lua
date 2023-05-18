return {
  {
    "windwp/nvim-autopairs",
    name = "autopairs",
    dependencies = {"nvim-treesitter/nvim-treesitter"},
    event = "VeryLazy",
    config = function()
      require('nvim-autopairs').setup({
        check_ts = true,
      })
    end,
  },
}
