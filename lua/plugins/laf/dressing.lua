return {
  {
    "stevearc/dressing.nvim",
    name = "dressing",
    event = "BufEnter",
    config = function()
      require('dressing').setup()
    end
  },
}
