--[[ Small plugins: guess-indent, vim-be-good, gitsigns. ]]
return {
  { 'NMAC427/guess-indent.nvim', opts = {} },
  'ThePrimeagen/vim-be-good',
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
    config = function(_, opts)
      require('gitsigns').setup(opts)
      local gs = require('gitsigns')
      vim.keymap.set('n', ']h', gs.next_hunk, { desc = 'Next [h]unk' })
      vim.keymap.set('n', '[h', gs.prev_hunk, { desc = 'Previous [h]unk' })
      vim.keymap.set('n', '<leader>hs', gs.stage_hunk, { desc = '[H]unk [S]tage' })
      vim.keymap.set('n', '<leader>hr', gs.reset_hunk, { desc = '[H]unk [R]eset' })
      vim.keymap.set('n', '<leader>hp', gs.preview_hunk, { desc = '[H]unk [P]review' })
      vim.keymap.set('n', '<leader>hb', gs.blame_line, { desc = '[H]unk [B]lame' })
    end,
  },
}
