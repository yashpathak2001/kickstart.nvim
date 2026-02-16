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
