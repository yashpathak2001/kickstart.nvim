--[[ 99 (ThePrimeagen): AI agent with Cursor backend. Requires cursor-agent CLI. ]]
-- In prompt: # = rules, @ = files (completion via blink).
return {
  {
    'ThePrimeagen/99',
    event = 'VimEnter',
    dependencies = {
      { 'saghen/blink.compat', version = '2.*' },
    },
    config = function()
      local _99 = require('99')
      local cwd = vim.uv.cwd()
      local basename = vim.fs.basename(cwd)

      _99.setup({
        provider = _99.Providers.CursorAgentProvider,
        -- model left unset = use provider default (sonnet-4.5 for cursor-agent)
        logger = {
          level = _99.WARN,
          path = '/tmp/' .. basename .. '.99.debug',
          print_on_error = true,
        },
        completion = {
          custom_rules = {},
          files = {},
          source = 'blink',
        },
        md_files = { 'AGENT.md' },
      })

      -- Visual: select code, then prompt (use in visual mode only so selection is current)
      vim.keymap.set('v', '<leader>9v', function()
        _99.visual()
      end, { desc = '99 [V]isual — prompt with selection' })

      -- Search: open prompt (search → prompt)
      vim.keymap.set('n', '<leader>99', function()
        _99.search()
      end, { desc = '99 Search — open prompt' })

      -- Stop all in-flight requests (any mode)
      vim.keymap.set('n', '<leader>9s', function()
        _99.stop_all_requests()
      end, { desc = '99 [S]top all requests' })
      vim.keymap.set('v', '<leader>9s', function()
        _99.stop_all_requests()
      end, { desc = '99 [S]top all requests' })

      -- Logs
      vim.keymap.set('n', '<leader>9l', function()
        _99.view_logs()
      end, { desc = '99 [L]ogs — view last run' })
      vim.keymap.set('n', '<leader>9[', function()
        _99.prev_request_logs()
      end, { desc = '99 prev log' })
      vim.keymap.set('n', '<leader>9]', function()
        _99.next_request_logs()
      end, { desc = '99 next log' })

      -- Info (rules, request count)
      vim.keymap.set('n', '<leader>9i', function()
        _99.info()
      end, { desc = '99 [I]nfo' })

      -- Quickfix list of previous requests
      vim.keymap.set('n', '<leader>9q', function()
        _99.previous_requests_to_qfix()
      end, { desc = '99 [Q]uickfix — request history' })

      -- Clear state
      vim.keymap.set('n', '<leader>9c', function()
        _99.clear_previous_requests()
      end, { desc = '99 [C]lear previous requests' })
      vim.keymap.set('n', '<leader>9m', function()
        _99.clear_all_marks()
      end, { desc = '99 clear [M]arks' })
    end,
  },
}
