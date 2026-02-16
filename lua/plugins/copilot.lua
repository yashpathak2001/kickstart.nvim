--[[ GitHub Copilot: inline completion + Copilot Chat (AI chat panel). ]]
return {
  -- Inline completion (ghost text). Run :Copilot auth to sign in.
  {
    'github/copilot.vim',
    event = 'InsertEnter',
    init = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
    end,
    config = function()
      vim.keymap.set('i', '<C-J>', 'copilot#Accept("<CR>")', { expr = true, silent = true, replace_keycodes = false })
      vim.keymap.set('i', '<C-]>', '<Plug>(copilot-dismiss)', { desc = 'Copilot dismiss' })
      vim.keymap.set('i', '<C-\\>', '<Plug>(copilot-suggest)', { desc = 'Copilot suggest' })
    end,
  },
  -- Chat panel (explain, generate, refactor). Uses same GitHub Copilot subscription.
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'canary',
    dependencies = { 'github/copilot.vim', 'nvim-lua/plenary.nvim' },
    cmd = 'CopilotChat',
    keys = {
      { '<leader>cc', '<cmd>CopilotChatToggle<cr>', desc = '[C]opilot [C]hat toggle' },
      { '<leader>ce', '<cmd>CopilotChatExplain<cr>', desc = '[C]opilot [E]xplain' },
      { '<leader>cF', '<cmd>CopilotChatFix<cr>', desc = '[C]opilot [F]ix' },
      { '<leader>cR', '<cmd>CopilotChatRefactor<cr>', desc = '[C]opilot [R]efactor' },
      { '<leader>cG', '<cmd>CopilotChatGenerate<cr>', desc = '[C]opilot [G]enerate' },
    },
    opts = {
      window = { layout = 'vertical', width = 0.5 },
      mappings = {
        submit = { normal = '<C-s>', insert = '<C-s>' },
        reset = { normal = '<C-r>', insert = '<C-r>' },
      },
    },
  },
}
