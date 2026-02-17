--[[ Mini.nvim: ai, surround, animate. (Statusline is handled by lualine.) ]]
return {
  {
    'nvim-mini/mini.nvim',
    config = function()
      require('mini.ai').setup({ n_lines = 500 })
      require('mini.surround').setup()
      -- Smooth cursor/window/scroll animations
      require('mini.animate').setup({
        cursor = { enable = true },
        scroll = { enable = true },
        resize = { enable = true },
        open = { enable = true },
        close = { enable = true },
      })
    end,
  },
}
