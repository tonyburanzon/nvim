return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('codecompanion').setup({
      strategies = {
        chat = {
          adapter = {
            name = 'copilot',
            model = 'claude-sonnet-4',
          },
          roles = {
            user = 'Tony',
          },
        },
      },
      display = {
        chat = {
          window = {
            layout = 'vertical',
            position = "right",
            width = 0.4,
          },
        },
      }
    })
  end,
  keys = {
    {
      '<leader>cc',
      '<cmd>CodeCompanionChat Toggle<cr>',
      desc = 'Code Companion Chat',
    },
    {
      mode = { 'v' },
      '<leader>cA',
      '<cmd>CodeCompanionChat Add<cr>',
      desc = 'Code Companion Add',
    },
    {
      '<leader>ca',
      '<cmd>CodeCompanionActions<cr>',
      desc = 'Code Companion Actions',
    },
    {
      mode = { 'n', 'v' },
      '<leader>cl',
      ":'<,'>CodeCompanion<cr>",
      desc = 'Code Companion Inline',
    },
  },
}
