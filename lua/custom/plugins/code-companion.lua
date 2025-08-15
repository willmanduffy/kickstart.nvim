return {
  'olimorris/codecompanion.nvim',
  enabled = false,
  opts = {},
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'ravitemer/mcphub.nvim',
  },
  config = function()
    require('codecompanion').setup {
      adapters = {
        openai = function()
          return require('codecompanion.adapters').extend('openai', {
            env = {
              api_key = 'cmd:op read op://Employee/OpenAI/credential --no-newline',
            },
          })
        end,
      },
      strategies = {
        chat = {
          adapter = 'openai',
        },
      },
    }
  end,
}
