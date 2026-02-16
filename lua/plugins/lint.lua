--[[ Linters: ruff (Python), eslint (JS/TS), etc. See :help nvim-lint. ]]
return {
  {
    'mfussenegger/nvim-lint',
    event = { 'BufWritePost', 'BufReadPost' },
    opts = {
      linters_by_ft = {
        python = { 'ruff' },
        javascript = { 'eslint_d' },
        javascriptreact = { 'eslint_d' },
        typescript = { 'eslint_d' },
        typescriptreact = { 'eslint_d' },
        json = { 'jsonlint' },
        jsonc = { 'jsonlint' },
        -- Override nvim-lint defaults that use 'vale' (fails if vale not installed)
        text = {},
        markdown = {},
        rst = {},
      },
    },
    config = function(_, opts)
      local lint = require('lint')
      for ft, linters in pairs(opts.linters_by_ft or {}) do
        lint.linters_by_ft[ft] = linters
      end
      vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufReadPost' }, {
        callback = function()
          lint.try_lint()
        end,
      })
      vim.keymap.set('n', '<leader>xl', function() lint.try_lint() end, { desc = '[L]int' })
    end,
  },
}
