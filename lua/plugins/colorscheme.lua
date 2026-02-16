--[[ Colorscheme: tokyonight. Change name here and in config to switch theme. ]]
return {
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    config = function()
      require('tokyonight').setup({
        styles = { comments = { italic = false } },
      })
      vim.cmd.colorscheme('tokyonight-night')
    end,
  },
}
