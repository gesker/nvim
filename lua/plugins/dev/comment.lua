return {
  {
    "numToStr/Comment.nvim",
    name = "comment",
    dependencies = {"JoosepAlviste/nvim-ts-context-commentstring"},
    keys = { "cc", "cb", "ccO", "cco", "ccA" },
    config = function()
      require("Comment").setup({
        ignore = "^$",
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
        ---Add a space b/w comment and the line
        padding = true,
        ---Whether the cursor should stay at its position
        sticky = true,
        ---Lines to be ignored while (un)comment
        ignore = nil,
        ---LHS of toggle mappings in NORMAL mode
        toggler = {
          ---Line-comment toggle keymap
          line = 'cc',
          ---Block-comment toggle keymap
          block = 'cb',
        },
        ---LHS of operator-pending mappings in NORMAL and VISUAL mode
        opleader = {
          ---Line-comment keymap
          line = 'cc',
          ---Block-comment keymap
          block = 'cb',
        },
        ---LHS of extra mappings
        extra = {
         ---Add comment on the line above
         above = 'ccO',
         ---Add comment on the line below
         below = 'cco',
         ---Add comment at the end of line
         eol = 'ccA',
        },
        ---Enable keybindings
        ---NOTE: If given `false` then the plugin won't create any mappings
        mappings = {
          basic = true,
          extra = true,
        },
        ---Function to call before (un)comment
        pre_hook = nil,
        ---Function to call after (un)comment
        post_hook = nil,
      })
    end,
  },
}
