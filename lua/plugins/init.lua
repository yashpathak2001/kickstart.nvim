--[[
  Plugin manager: lazy.nvim.
  All plugin specs are split into lua/plugins/*.lua (e.g. telescope.lua, lsp.lua).
  Add new plugins in the appropriate file or create lua/plugins/myplugin.lua and
  add it to the list below.
  See :help lazy.nvim and :help lazy.nvim-🔌-plugin-spec
]]

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

vim.opt.rtp:prepend(lazypath)

local plugin_modules = {
  'misc',         -- guess-indent, vim-be-good, gitsigns
  'which-key',    -- keybinding hints
  'telescope',    -- fuzzy finder
  'lsp',          -- LSP, Mason, fidget
  'conform',      -- format on save
  'blink-cmp',    -- completion
  'colorscheme',  -- tokyonight
  'todo-comments',
  'mini',         -- ai, surround, statusline
  'treesitter',
  -- IDE-style
  'neo-tree',     -- file explorer (left sidebar)
  'undotree',     -- undo tree
  'diffview',     -- git diffs & file history
  'toggleterm',   -- terminal
  'copilot',      -- GitHub Copilot completion + chat
  'aerial',       -- outline / symbols sidebar
  'lint',         -- nvim-lint (ruff, eslint, etc.)
  'dap',          -- debugger (Python, C/C++, C#, Java)
}

local plugins = {}
for _, name in ipairs(plugin_modules) do
  local mod = require('plugins.' .. name)
  if type(mod) == 'table' then
    for _, spec in ipairs(mod) do
      table.insert(plugins, spec)
    end
  end
end

-- Optional: load user plugins from lua/custom/plugins/*.lua
-- Uncomment to enable: table.insert(plugin_modules, 'custom.plugins')
-- and ensure lua/custom/plugins/init.lua returns a list of specs.

require('lazy').setup(plugins, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
