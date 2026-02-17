--[[ Terminal: floating/toggle terminal. Run current file with <leader>rr. ]]
return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    cmd = 'ToggleTerm',
    keys = {
      { '<leader>tt', '<cmd>ToggleTerm direction=float<cr>', desc = '[T]oggle [T]erminal (float)' },
      { '<leader>tH', '<cmd>ToggleTerm direction=horizontal size=15<cr>', desc = '[T]erminal [H]orizontal' },
      { '<leader>tv', '<cmd>ToggleTerm direction=vertical size=60<cr>', desc = '[T]erminal [V]ertical' },
      { '<C-\\>', '<cmd>ToggleTerm direction=float<cr>', desc = 'Toggle terminal (float)' },
      { '<leader>rr', false },  -- set in config
    },
    opts = {
      size = function(term)
        if term.direction == 'horizontal' then
          return 15
        elseif term.direction == 'vertical' then
          return vim.o.columns * 0.4
        end
        return 20
      end,
      open_mapping = nil,
      hide_numbers = true,
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = 'float',
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = 'rounded',
        winblend = 0,
      },
    },
    config = function(_, opts)
      require('toggleterm').setup(opts)
      -- Run current file in a floating terminal
      vim.keymap.set('n', '<leader>rr', function()
        local buf = vim.api.nvim_get_current_buf()
        local path = vim.api.nvim_buf_get_name(buf)
        if path == '' or vim.bo[buf].buftype ~= '' then
          vim.notify('No file to run', vim.log.levels.WARN)
          return
        end
        local dir = vim.fn.fnamemodify(path, ':h')
        local ft = vim.bo[buf].ft
        local cmd
        if ft == 'python' then
          cmd = ('python3 %s'):format(vim.fn.shellescape(path))
        elseif ft == 'lua' then
          cmd = ('lua %s'):format(vim.fn.shellescape(path))
        elseif ft == 'javascript' or ft == 'javascriptreact' then
          cmd = ('node %s'):format(vim.fn.shellescape(path))
        elseif ft == 'typescript' or ft == 'typescriptreact' then
          cmd = ('npx ts-node %s'):format(vim.fn.shellescape(path))
        elseif ft == 'sh' or ft == 'bash' or ft == 'zsh' then
          cmd = ('bash %s'):format(vim.fn.shellescape(path))
        elseif ft == 'go' then
          cmd = ('go run %s'):format(vim.fn.shellescape(path))
        elseif ft == 'rust' then
          if vim.fn.filereadable(dir .. '/Cargo.toml') == 1 then
            cmd = 'cargo run'
          else
            cmd = ('rustc %s && ./%s'):format(vim.fn.shellescape(path), vim.fn.fnamemodify(path, ':t:r'))
          end
        elseif ft == 'ruby' then
          cmd = ('ruby %s'):format(vim.fn.shellescape(path))
        else
          vim.notify(('No runner for filetype "%s"'):format(ft), vim.log.levels.WARN)
          return
        end
        local Term = require('toggleterm.terminal').Terminal
        local run_term = Term:new({
          cmd = cmd,
          dir = dir,
          direction = 'float',
          float_opts = { border = 'rounded' },
          close_on_exit = false,
        })
        run_term:toggle()
      end, { desc = '[R]un current file' })
    end,
  },
}
