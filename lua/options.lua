--[[
  Neovim editor options (vim.o / vim.opt).
  See :help option-list and :help lua-guide-options
]]

-- Line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Mouse and UI
vim.o.mouse = 'a'
vim.o.showmode = false

-- Clipboard (sync with OS; scheduled to avoid slowing startup)
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Indentation and undo
vim.o.breakindent = true
vim.o.undofile = true

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Gutter and signs
vim.o.signcolumn = 'yes'

-- Timing
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Splits
vim.o.splitright = true
vim.o.splitbelow = true

-- Tab line (buffer tabs at top): always visible so new files show in the bar immediately
vim.opt.showtabline = 2

-- Reserve one line for messages to avoid E36 "Not enough room" when plugins echo/notify on FileType
vim.opt.cmdheight = 1
-- Allow small popups (e.g. neo-tree paste input) to open without E36
vim.opt.winminheight = 1
vim.opt.winminwidth = 1

-- Whitespace display (listchars)
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Substitution preview and cursor
vim.o.inccommand = 'split'
vim.o.cursorline = true
vim.o.scrolloff = 10

-- Confirm instead of failing on unsaved changes
vim.o.confirm = true

-- Diagnostics (LSP/vim.diagnostic)
vim.diagnostic.config({
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = vim.diagnostic.severity.ERROR },
  virtual_text = true,
  virtual_lines = false,
  jump = { float = true },
})
