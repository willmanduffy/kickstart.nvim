-- Open current file/selection on GitHub (or copy the URL)
return {
  -- core git helpers
  { 'tpope/vim-fugitive' },

  -- adds :Gbrowse for GitHub URLs
  {
    'tpope/vim-rhubarb',
    dependencies = { 'tpope/vim-fugitive' },
    init = function()
      -- If you use GitHub Enterprise, uncomment and set your host:
      -- vim.g.github_enterprise_urls = { "https://github.yourcompany.com" }
    end,
    config = function()
      -- <leader>go → open on GitHub (file or visual selection)
      vim.keymap.set('n', '<leader>go', ':GBrowse<CR>', { desc = 'Open on GitHub' })
      vim.keymap.set('v', '<leader>go', ':GBrowse<CR>', { desc = 'Open selection on GitHub' })

      -- <leader>gO → copy URL instead of opening
      vim.keymap.set('n', '<leader>gO', ':GBrowse!<CR>', { desc = 'Copy GitHub URL' })
      vim.keymap.set('v', '<leader>gO', ':GBrowse!<CR>', { desc = 'Copy GitHub URL (selection)' })
    end,
  },
}
