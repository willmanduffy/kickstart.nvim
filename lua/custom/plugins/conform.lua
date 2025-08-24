return {
  'stevearc/conform.nvim',
  opts = function(_, opts)
    -- keep existing opts if Kickstart set some
    opts.formatters_by_ft = vim.tbl_deep_extend('force', opts.formatters_by_ft or {}, {
      javascript = { 'eslint_d' },
      typescript = { 'eslint_d' },
      javascriptreact = { 'eslint_d' },
      typescriptreact = { 'eslint_d' },
    })

    opts.format_on_save = function(bufnr)
      local filepath = vim.api.nvim_buf_get_name(bufnr)
      if string.find(filepath, '/Users/willmanduffy/src/frontend/') then
        return { lsp_fallback = true, formatters = { 'eslint_d' } }
      end
      return { lsp_fallback = true }
    end

    return opts
  end,
}
