--[[ Document outline / symbols (sidebar). Like VS Code "Outline" view. ]]
return {
  {
    'stevearc/aerial.nvim',
    cmd = { 'AerialToggle', 'AerialOpen', 'AerialNavToggle' },
    keys = {
      { '<leader>o', '<cmd>AerialToggle right<cr>', desc = '[O]utline (symbols)' },
      { '[[', '<cmd>AerialPrev<cr>', desc = 'Previous symbol' },
      { ']]', '<cmd>AerialNext<cr>', desc = 'Next symbol' },
    },
    opts = {
      backends = { 'treesitter', 'lsp', 'markdown' },
      layout = { min_width = 28, default_direction = 'prefer_right' },
      show_guides = true,
      filter_kind = false,
    },
  },
}
