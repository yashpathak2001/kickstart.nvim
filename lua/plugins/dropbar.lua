--[[ Dropbar: IDE-like breadcrumbs at the top of each buffer. ]]
return {
  {
    'Bekaboo/dropbar.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      general = { enable = true },
      menu = {
        keymaps = {
          ['<Esc>'] = 'close',
          ['q'] = 'close',
          ['<CR>'] = 'pick',
          ['<Tab>'] = 'next',
          ['<S-Tab>'] = 'prev',
        },
      },
      bar = {
        pick = { pivot_icon = '' },
        truncate = true,
      },
      -- Use default sources (path + LSP/treesitter symbol); do not set sources.path/symbol to booleans
    },
    config = function(_, opts)
      require('dropbar').setup(opts)
      local api = require('dropbar.api')
      vim.keymap.set('n', '<leader>;', api.pick, { desc = 'Dropbar: pick symbol' })
      vim.keymap.set('n', '[;', api.goto_context_start, { desc = 'Dropbar: start of context' })
      vim.keymap.set('n', '];', api.select_next_context, { desc = 'Dropbar: next context' })
    end,
  },
}
