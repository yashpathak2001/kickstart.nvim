--[[ Lualine: statusline per window, git branch/diff + lines added/removed, Trouble symbols. ]]
return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'folke/trouble.nvim',
    },
    opts = function(_, _opts)
      local trouble = require('trouble')
      local symbols = trouble.statusline({
        mode = 'lsp_document_symbols',
        groups = {},
        title = false,
        filter = { range = true },
        format = '{kind_icon}{symbol.name:Normal}',
        hl_group = 'lualine_c_normal',
      })

      -- Custom: git diff stats (lines added / removed) for statusline
      local function git_diff_stats()
        local buf = vim.api.nvim_get_current_buf()
        local file = vim.api.nvim_buf_get_name(buf)
        if file == '' or vim.bo[buf].buftype ~= '' then return '' end
        local dir = vim.fn.fnamemodify(file, ':h')
        local out = vim.fn.system({ 'git', '-C', dir, 'diff', '--shortstat', 'HEAD', '--', file })
        if out == nil or out == '' then
          out = vim.fn.system({ 'git', '-C', dir, 'diff', '--shortstat', '--staged', '--', file })
        end
        if out == nil or out == '' then return '' end
        local add = out:match('(%d+) insertion') or '0'
        local del = out:match('(%d+) deletion') or '0'
        if add == '0' and del == '0' then return '' end
        return '+' .. add .. ' -' .. del
      end

      return {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '\u{e0b1}', right = '\u{e0b3}' },
          section_separators = { left = '\u{e0b0}', right = '\u{e0b2}' },
          disabled_filetypes = { statusline = {}, winbar = {} },
          ignore_focus = {},
          always_divide_middle = true,
          always_show_tabline = true,
          -- One statusline per window (each pane/split has its own)
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
            refresh_time = 16,
            events = {
              'WinEnter', 'BufEnter', 'BufWritePost', 'SessionLoadPost',
              'FileChangedShellPost', 'VimResized', 'Filetype',
              'CursorMoved', 'CursorMovedI', 'ModeChanged',
            },
          },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = {
            'branch',
            'diff',
            { git_diff_stats, color = { fg = '#7ee787' } },  -- +N -M lines added/removed
            'diagnostics',
          },
          lualine_c = {
            'filename',
            { symbols.get, cond = symbols.has },
          },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = { 'branch', 'diff' },
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        -- Tabline disabled: bufferline.nvim shows file tabs at top instead
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {},
      }
    end,
  },
}
