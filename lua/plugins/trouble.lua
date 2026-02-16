--[[ Trouble.nvim: diagnostics/errors/warnings pane (LSP + linter). ]]
return {
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = 'Trouble',
    keys = {
      { '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Diagnostics (Trouble)' },
      { '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Buffer Diagnostics (Trouble)' },
      { '<leader>cs', '<cmd>Trouble symbols toggle focus=false<cr>', desc = 'Symbols (Trouble)' },
      { '<leader>cl', '<cmd>Trouble lsp toggle focus=false win.position=right<cr>', desc = 'LSP Definitions / references / ... (Trouble)' },
      { '<leader>xL', '<cmd>Trouble loclist toggle<cr>', desc = 'Location List (Trouble)' },
      { '<leader>xQ', '<cmd>Trouble qflist toggle<cr>', desc = 'Quickfix List (Trouble)' },
    },
    opts = {
      action_keys = {
        close = { 'q', '<esc>' },
        cancel = '<c-e>',
        refresh = 'r',
        jump = { '<cr>', '<tab>' },
        open_split = { '<c-x>' },
        open_vsplit = { '<c-v>' },
        open_tab = { '<c-t>' },
        jump_close = 'o',
        previous = 'k',
        next = 'j',
      },
    },
    config = function(_, opts)
      require('trouble').setup(opts)
      -- Match Trouble window background to editor (transparent or same as Normal)
      vim.api.nvim_set_hl(0, 'TroubleNormal', { link = 'Normal' })
      vim.api.nvim_set_hl(0, 'TroubleNormalNC', { link = 'Normal' })
    end,
  },
}
