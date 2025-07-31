return {
  'olimorris/codecompanion.nvim',
  opts = {
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
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
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
