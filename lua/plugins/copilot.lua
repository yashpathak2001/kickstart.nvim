--[[ GitHub Copilot: official plugin + copilot.lua (both kept) + Copilot Chat. ]]
return {
  -- Official GitHub Copilot (copilot.vim). Auth: :Copilot auth
  {
    'github/copilot.vim',
    event = 'InsertEnter',
    init = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
    end,
    config = function()
      -- Separate keys from copilot.lua so both plugins work without conflict
      vim.keymap.set('i', '<M-J>', 'copilot#Accept("<CR>")', { expr = true, silent = true, replace_keycodes = false, desc = 'Copilot (official) accept' })
      vim.keymap.set('i', '<M-]>', '<Plug>(copilot-dismiss)', { desc = 'Copilot (official) dismiss' })
      vim.keymap.set('i', '<M-\\>', '<Plug>(copilot-suggest)', { desc = 'Copilot (official) suggest' })
    end,
  },
  -- copilot.lua: disabled (using official copilot.vim only)
  {
    'zbirenbaum/copilot.lua',
    enabled = false,
    event = 'InsertEnter',
    cmd = 'Copilot',
    build = false,
    priority = 100,
    opts = {
      panel = {
        enabled = true,
        auto_refresh = false,
        keymap = {
          jump_prev = '[[',
          jump_next = ']]',
          accept = '<CR>',
          refresh = 'gr',
          open = '<M-CR>',
        },
        layout = { position = 'bottom', ratio = 0.4 },
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 15,
        -- Keymaps are set below via :Copilot commands so they override any legacy bindings
        keymap = {
          accept = false,
          accept_word = false,
          accept_line = false,
          next = false,
          prev = false,
          dismiss = false,
          toggle_auto_trigger = false,
        },
      },
      filetypes = { ['*'] = true },
      -- Attach to normal file buffers so panel and suggestions work (avoids "should attach config" message)
      should_attach = function(_, arg)
        local bufnr = type(arg) == 'number' and arg or vim.api.nvim_get_current_buf()
        if vim.bo[bufnr].buftype ~= '' then
          return false
        end
        return true
      end,
    },
    config = function(_, opts)
      require('copilot').setup(opts)

      -- Use :Copilot commands so these are the canonical shortcuts (replaces any old copilot.vim bindings)
      vim.keymap.set('i', '<C-J>', '<cmd>Copilot suggestion accept<cr>', { desc = 'Copilot accept' })
      vim.keymap.set('i', '<C-]>', '<cmd>Copilot suggestion dismiss<cr>', { desc = 'Copilot dismiss' })
      vim.keymap.set('i', '<C-\\>', '<cmd>Copilot suggestion next<cr>', { desc = 'Copilot next suggestion' })
      vim.keymap.set('i', '<C-[>', '<cmd>Copilot suggestion prev<cr>', { desc = 'Copilot prev suggestion' })

      vim.keymap.set('n', '<M-CR>', '<cmd>Copilot panel open<cr>', { desc = 'Copilot panel open' })

      -- Hide Copilot suggestion when completion menu (blink-cmp) is open
      vim.api.nvim_create_autocmd('User', {
        pattern = 'BlinkCmpMenuOpen',
        callback = function()
          vim.b.copilot_suggestion_hidden = true
        end,
      })
      vim.api.nvim_create_autocmd('User', {
        pattern = 'BlinkCmpMenuClose',
        callback = function()
          vim.b.copilot_suggestion_hidden = false
        end,
      })
    end,
  },
  -- Chat panel (explain, generate, refactor). Uses same GitHub Copilot subscription.
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'main',
    dependencies = { 'github/copilot.vim', 'nvim-lua/plenary.nvim' },
    cmd = 'CopilotChat',
    keys = {
      { '<leader>cc', '<cmd>CopilotChatToggle<cr>', desc = '[C]opilot [C]hat toggle' },
      { '<leader>ce', '<cmd>CopilotChatExplain<cr>', desc = '[C]opilot [E]xplain' },
      { '<leader>cF', '<cmd>CopilotChatFix<cr>', desc = '[C]opilot [F]ix' },
      { '<leader>cR', '<cmd>CopilotChatRefactor<cr>', desc = '[C]opilot [R]efactor' },
      { '<leader>cG', '<cmd>CopilotChatGenerate<cr>', desc = '[C]opilot [G]enerate (instruction → code at cursor)' },
      { '<leader>ci', '<cmd>CopilotChat #buffer At the cursor, add a function that <cr>', desc = '[C]opilot [I]nline: chat with "add a function that …" prefilled' },
      { '<leader>cn', '<cmd>enew<cr>', desc = '[C]opilot: [N]ew buffer (then chat + accept diff)' },
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
