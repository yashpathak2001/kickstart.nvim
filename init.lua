--[[
  Neovim config entry point.
  Layout (recommended modular structure):
  - lua/options.lua    → Editor options, diagnostic config
  - lua/keymaps.lua    → Global keymaps (Esc, window nav, etc.)
  - lua/autocmds.lua   → Global autocommands (e.g. highlight yank)
  - lua/plugins/       → All plugins (lazy.nvim)
      - init.lua       → Bootstrap lazy + load plugin modules
      - misc.lua       → guess-indent, vim-be-good, gitsigns
      - which-key.lua  → Keybinding hints
      - telescope.lua  → Fuzzy finder (files, grep, LSP, etc.)
      - lsp.lua        → LSP, Mason, mason-tool-installer, fidget
      - conform.lua    → Format on save, <leader>f
      - blink-cmp.lua  → Completion (LSP, path, snippets)
      - colorscheme.lua→ tokyonight
      - todo-comments.lua
      - mini.lua       → mini.ai, mini.surround, mini.statusline
      - treesitter.lua → Syntax parsing
      - neo-tree.lua   → File explorer (left sidebar)
      - undotree.lua   → Undo tree
      - diffview.lua   → Git diffs & file history
      - toggleterm.lua → Terminal
      - copilot.lua    → GitHub Copilot + Copilot Chat
      - aerial.lua     → Outline / symbols sidebar
      - lint.lua       → Linters (ruff, eslint, jsonlint)
      - dap.lua        → Debugger (Python, C/C++, C#, Java)
  Keybinds: see KEYBINDS.md in this directory.
  Add new plugins: create lua/plugins/foo.lua (return {...}) and add 'foo' in lua/plugins/init.lua.
]]

-- Leader must be set before plugins load
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

require('options')
require('keymaps')
require('autocmds')
require('plugins')
