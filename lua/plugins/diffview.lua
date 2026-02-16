--[[ Git diff view and commit history. Diffs, file history, open in split. ]]
return {
  {
    'sindrets/diffview.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewRefresh', 'DiffviewFileHistory' },
    keys = {
      { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = '[G]it [D]iff (open diff view)' },
      { '<leader>gD', '<cmd>DiffviewClose<cr>', desc = '[G]it diff close' },
      { '<leader>gh', '<cmd>DiffviewFileHistory %<cr>', desc = '[G]it [H]istory (current file)' },
      { '<leader>gH', '<cmd>DiffviewFileHistory<cr>', desc = '[G]it [H]istory (project)' },
    },
    opts = {
      view = {
        default = {
          layout = 'diff2_horizontal',
          winbar_info = true,
        },
        merge_tool = {
          layout = 'diff3_mixed',
        },
      },
      file_panel = {
        listing_style = 'tree',
        tree_options = { flatten_dirs = true },
      },
    },
  },
}
