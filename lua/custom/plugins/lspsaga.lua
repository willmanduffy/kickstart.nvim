return {
  'nvimdev/lspsaga.nvim',
  event = 'LspAttach',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'nvim-treesitter/nvim-treesitter',
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('lspsaga').setup {
      ui = {
        border = 'rounded',
        colors = {
          normal_bg = '#2a2e36',
        },
      },
      symbol_in_winbar = {
        enable = false,
      },
      vim.keymap.set('n', 'gk', '<Cmd>Lspsaga hover_doc<CR>', { desc = 'Hover Doc' }),
      vim.keymap.set('n', 'gd', '<Cmd>Lspsaga peek_definition<CR>', { desc = 'Peek Definition' }),
      vim.keymap.set('n', 'gD', '<Cmd>Lspsaga goto_definition<CR>', { desc = '[G]oto [D]efinition' }),
      vim.keymap.set('n', 'ca', '<Cmd>Lspsaga code_action<CR>', { desc = '[C]ode [A]ction' }),
    }
  end,
}
