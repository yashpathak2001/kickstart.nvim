--[[ Mini.nvim: ai, surround, statusline. See https://github.com/nvim-mini/mini.nvim ]]
return {
  {
    'nvim-mini/mini.nvim',
    config = function()
      require('mini.ai').setup({ n_lines = 500 })
      require('mini.surround').setup()
      local statusline = require('mini.statusline')
      statusline.setup({ use_icons = vim.g.have_nerd_font })
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end
    end,
  },
}
