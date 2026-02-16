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
      filesystem = {
        follow_current_file = { enabled = true },
        hijack_netrw_behavior = 'open_default',
        use_libuv_file_watcher = true,
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
    config = function()
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
