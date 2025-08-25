return {
  'akinsho/bufferline.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    { 'catppuccin/nvim', name = 'catppuccin' },
  },
  config = function()
    local highlights -- can be a table or a function returning a table

    local ok, cat = pcall(require, 'catppuccin.groups.integrations.bufferline')
    if ok then
      if type(cat) == 'table' and type(cat.get) == 'function' then
        -- Newer shape: module table with .get()
        highlights = cat.get()
      elseif type(cat) == 'function' then
        -- Older shape: module IS the function
        highlights = cat()
      end
    end

    require('bufferline').setup {
      options = {
        mode = 'buffers',
        diagnostics = 'nvim_lsp',
        separator_style = 'slant',
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
      highlights = highlights,
    }
    -- Keymaps (feel free to tweak)
    local map = vim.keymap.set
    -- cycle through buffers
    map('n', '<S-l>', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next buffer' })
    map('n', '<S-h>', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Prev buffer' })
    -- move buffers
    map('n', '<A-l>', '<cmd>BufferLineMoveNext<cr>', { desc = 'Move buffer right' })
    map('n', '<A-h>', '<cmd>BufferLineMovePrev<cr>', { desc = 'Move buffer left' })
    -- pick buffer by letter
    map('n', '<leader>bp', '<cmd>BufferLinePick<cr>', { desc = 'Pick buffer' })
    -- close current
    map('n', '<leader>bc', '<cmd>bdelete<cr>', { desc = 'Close buffer' })
    -- jump directly 1..9
    for i = 1, 9 do
      map('n', ('<leader>%d'):format(i), function()
        require('bufferline').go_to(i, true)
      end, { desc = ('Go to buffer %d'):format(i) })
    end
  end,
}
