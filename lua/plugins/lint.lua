--[[ Linters: ruff (Python), eslint_d (JS/TS), jsonlint. Install via :Mason. ]]
return {
  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPost', 'BufWritePost', 'BufEnter' },
    opts = {
      linters_by_ft = {
        python = { 'ruff' },
        javascript = { 'eslint_d' },
        javascriptreact = { 'eslint_d' },
        typescript = { 'eslint_d' },
        typescriptreact = { 'eslint_d' },
        json = { 'jsonlint' },
        jsonc = { 'jsonlint' },
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
      local run_lint = function()
        lint.try_lint()
      end
      vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufReadPost' }, {
        callback = run_lint,
      })
      vim.api.nvim_create_autocmd('BufEnter', {
        callback = function()
          -- Only run on normal file buffers (skip popups like neo-tree paste input to avoid E36)
          if vim.bo.buftype ~= '' then return end
          vim.defer_fn(run_lint, 50)
        end,
      })
      vim.keymap.set('n', '<leader>xl', run_lint, { desc = '[L]int (run linters)' })
    end,
  },
}
