return {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false, -- load immediately
  priority = 1000, -- make sure it loads before other plugins
  config = function()
    require('catppuccin').setup {
      flavour = 'latte', -- latte, frappe, macchiato, mocha
      transparent_background = false,
      integrations = {
        treesitter = true,
        native_lsp = { enabled = true },
        cmp = true,
        gitsigns = true,
        telescope = true,
        nvimtree = true,
        which_key = true,
      },
    }

    -- apply the colorscheme
    vim.cmd.colorscheme 'catppuccin'
  end,
}
