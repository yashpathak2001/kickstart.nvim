--[[ File explorer (sidebar). Like VS Code / Cursor file browser. See :help neo-tree. ]]
return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    keys = {
      { '<leader>e', '<cmd>Neotree toggle left<cr>', desc = '[E]xplorer (file tree)' },
      { '<leader>E', '<cmd>Neotree focus left<cr>', desc = '[E]xplorer focus' },
      { '<leader>eP', '<cmd>Neotree show left<cr>', desc = '[E]xplorer [P]in (show and keep open)' },
    },
    opts = {
      close_if_last_window = false,
      -- Use cmdline for paste/copy/rename input instead of nui popup (avoids E36 on BufWinEnter)
      use_popups_for_input = false,
      filesystem = {
        follow_current_file = { enabled = true },
        hijack_netrw_behavior = 'open_default',
        use_libuv_file_watcher = true,
        filtered_items = {
          visible = true,           -- show filtered (e.g. dotfiles) in tree instead of only "(X hidden items)"
          show_hidden_count = false, -- do not show "(X hidden items)" line
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_ignored = false,
          hide_hidden = false,       -- Windows: show hidden files/dirs
        },
      },
      window = {
        position = 'left',
        width = 35,
        mapping_options = { noremap = true, nowait = true },
        mappings = {
          ['<space>'] = { 'toggle_node', nowait = false },
          ['<cr>'] = 'open',
          ['t'] = 'open_tabnew',
          ['<esc>'] = 'cancel',
          ['P'] = { 'toggle_preview', config = { use_float = true } },
          ['l'] = 'open',
          ['h'] = 'close_node',
          ['z'] = 'close_all_nodes',
          ['Z'] = 'expand_all_nodes',
          ['a'] = { 'add', config = { show_path = 'none' } },
          ['A'] = 'add_directory',
          ['d'] = 'delete',
          ['r'] = 'rename',
          ['y'] = 'copy_to_clipboard',
          ['x'] = 'cut_to_clipboard',
          ['p'] = 'paste_from_clipboard',
          ['c'] = 'copy',
          ['m'] = 'move',
          ['S'] = 'open_split',
          ['s'] = 'open_vsplit',
          ['q'] = 'close_window',
          ['R'] = 'refresh',
          ['?'] = 'show_help',
        },
      },
    },
    config = function(_, opts)
      -- Force filesystem filtered_items so dotfiles show and "(X hidden items)" is gone
      opts.filesystem = opts.filesystem or {}
      opts.filesystem.filtered_items = vim.tbl_extend('force', opts.filesystem.filtered_items or {}, {
        visible = true,
        show_hidden_count = false,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_ignored = false,
        hide_hidden = false,
      })
      -- Remove "current_filter" component so "(X hidden items)" is never drawn
      local ok, defaults = pcall(require, 'neo-tree.defaults')
      if ok and defaults and defaults.renderers and defaults.renderers.directory then
        local dir = defaults.renderers.directory
        local new_dir = {}
        for _, r in ipairs(dir) do
          local name = type(r) == 'string' and r or (r[1])
          if name ~= 'current_filter' then
            table.insert(new_dir, r)
          end
        end
        opts.renderers = vim.tbl_deep_extend('force', opts.renderers or {}, { directory = new_dir })
      else
        -- Fallback: set directory renderer explicitly without current_filter (matches neo-tree defaults)
        opts.renderers = vim.tbl_deep_extend('force', opts.renderers or {}, {
          directory = {
            { 'indent' },
            { 'icon' },
            {
              'container',
              content = {
                { 'name', zindex = 10 },
                { 'symlink_target', zindex = 10, highlight = 'NeoTreeSymbolicLinkTarget' },
                { 'clipboard', zindex = 10 },
                { 'diagnostics', errors_only = true, zindex = 20, align = 'right', hide_when_expanded = true },
                { 'git_status', zindex = 10, align = 'right', hide_when_expanded = true },
                { 'file_size', zindex = 10, align = 'right' },
                { 'type', zindex = 10, align = 'right' },
                { 'last_modified', zindex = 10, align = 'right' },
                { 'created', zindex = 10, align = 'right' },
              },
            },
          },
        })
      end
      require('neo-tree').setup(opts)
      -- When opening a new tab, show the file tree in that tab too
      vim.api.nvim_create_autocmd('TabNew', {
        group = vim.api.nvim_create_augroup('neo-tree-pin', { clear = true }),
        callback = function()
          pcall(vim.cmd, 'Neotree show left')
        end,
      })
    end,
  },
}
