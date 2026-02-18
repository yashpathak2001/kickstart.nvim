--[[ Auto-session: save/restore workspace layout and open files per folder. ]]
return {
  {
    'rmagatti/auto-session',
    lazy = false,
    keys = {
      { '<leader>ws', '<cmd>AutoSession save<cr>', desc = '[W]orkspace [S]ave session' },
      { '<leader>wl', '<cmd>AutoSession restore<cr>', desc = '[W]orkspace [L]oad session' },
      { '<leader>wf', '<cmd>AutoSession search<cr>', desc = '[W]orkspace [F]ind sessions (picker)' },
      { '<leader>wa', '<cmd>AutoSession toggle<cr>', desc = '[W]orkspace toggle [A]utosave' },
    },
    opts = {
      auto_save = true,
      auto_restore = true,
      auto_create = true,
      -- Don't auto-save in home or root (avoid clutter)
      suppressed_dirs = { '~/', '~/Downloads', '/' },
      session_lens = {
        load_on_setup = true,
        picker = 'telescope',
      },
      -- After restore: keep tab bar visible and reopen neo-tree
      post_restore_cmds = {
        function()
          vim.opt.showtabline = 2
          pcall(vim.cmd, 'Neotree show left')
        end,
      },
    },
  },
}
