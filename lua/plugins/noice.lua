--[[ Noice: cmdline/messages disabled to avoid flash + error cascade. Notify: toasts only. ]]
return {
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      -- Off: cmdline popup was flashing and vanishing, causing noice errors and error cascade
      cmdline = { enabled = false },
      -- Off: noice message handling was in the path when errors showed, increasing error count
      messages = { enabled = false },
      popupmenu = { enabled = false },
      notify = { view = 'notify', opts = {} },
      routes = {
        { filter = { event = 'msg_show', find = 'E36' }, opts = { skip = true } },
        { filter = { event = 'msg_show', find = 'Not enough room' }, opts = { skip = true } },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = true,
      },
    },
  },
  {
    'rcarriga/nvim-notify',
    keys = {
      {
        '<leader>un',
        function()
          require('notify').dismiss({ pending = true, silent = true })
        end,
        desc = '[U]I: [N]otifications dismiss',
      },
    },
    opts = {
      stages = 'fade_in_slide_out',
      timeout = 3000,
      -- Cap size so notifications don't trigger E36 "Not enough room" on small windows
      max_height = function() return math.min(10, math.max(1, math.floor(vim.o.lines * 0.25))) end,
      max_width = function() return math.min(60, math.max(20, math.floor(vim.o.columns * 0.4))) end,
      on_open = nil,
      on_close = nil,
      render = 'default',
      top_down = true,
    },
    config = function(_, opts)
      require('notify').setup(opts)
      local notify = require('notify')
      -- Don't show notifications titled "noice.nvim" (noice's own errors)
      vim.notify = function(msg, level, opts_in)
        if type(opts_in) == 'table' and opts_in.title == 'noice.nvim' then
          return
        end
        return notify(msg, level, opts_in)
      end
    end,
  },
}
