--[[ Bufferline: file tabs at top like VS Code/Cursor (one tab per open file). ]]
return {
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    keys = {
      { '<leader>bp', '<cmd>BufferLineCyclePrev<cr>', desc = '[B]uffer [P]revious' },
      { '<leader>bn', '<cmd>BufferLineCycleNext<cr>', desc = '[B]uffer [N]ext' },
      {
        '<leader>bc',
        function()
          local buflist = vim.tbl_filter(function(b)
            return vim.bo[b].buflisted and vim.bo[b].buftype == ''
          end, vim.api.nvim_list_bufs())
          if #buflist <= 1 then
            vim.cmd('enew')
            vim.cmd('bdelete #')
          else
            vim.cmd('BufferLineCycleNext')
            vim.cmd('bdelete #')
          end
        end,
        desc = '[B]uffer [C]lose (keep window open)',
      },
      { '<leader>bC', '<cmd>BufferLineCloseOthers<cr>', desc = '[B]uffer close [C]others' },
      { '<leader>b1', '<cmd>BufferLineGoToBuffer 1<cr>', desc = 'Go to buffer 1' },
      { '<leader>b2', '<cmd>BufferLineGoToBuffer 2<cr>', desc = 'Go to buffer 2' },
      { '<leader>b3', '<cmd>BufferLineGoToBuffer 3<cr>', desc = 'Go to buffer 3' },
      { '<leader>b4', '<cmd>BufferLineGoToBuffer 4<cr>', desc = 'Go to buffer 4' },
      { '<leader>b5', '<cmd>BufferLineGoToBuffer 5<cr>', desc = 'Go to buffer 5' },
    },
    opts = {
      options = {
        mode = 'buffers',
        themable = true,
        numbers = 'ordinal',
        close_command = 'bdelete! %d',
        right_mouse_command = 'bdelete! %d',
        left_mouse_command = 'buffer %d',
        middle_mouse_command = nil,
        indicator = { style = 'icon', icon = '▎' },
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        max_name_length = 18,
        max_prefix_length = 15,
        truncate_names = true,
        tab_size = 18,
        diagnostics = 'nvim_lsp',
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(count, level)
          local icon = level:match('error') and ' ' or ' '
          return icon .. count
        end,
        offsets = { { filetype = 'neo-tree', text = 'File Explorer', text_align = 'left' } },
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        show_duplicate_prefix = true,
        persist_buffer_sort = true,
        separator_style = 'thin',
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        sort_by = 'insert_after_current',
      },
    },
    config = function(_, opts)
      require('bufferline').setup(opts)
      -- Ctrl+Tab / Ctrl+Shift+Tab to switch buffers (like VS Code)
      vim.keymap.set('n', '<C-Tab>', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next buffer' })
      vim.keymap.set('n', '<C-S-Tab>', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Previous buffer' })
    end,
  },
}
