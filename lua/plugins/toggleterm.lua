--[[ Terminal: floating/toggle terminal. Like VS Code integrated terminal. ]]
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
  },
}
