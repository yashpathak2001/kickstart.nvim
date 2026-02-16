--[[
  Global keymaps (non–plugin-specific).
  Plugin keymaps live in lua/plugins/*.lua (e.g. Telescope, LSP).
  See :help vim.keymap.set()
]]

-- Clear search highlight on Esc
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Quit Neovim entirely (all tabs/buffers)
vim.keymap.set('n', '<leader>qq', '<cmd>qa<cr>', { desc = '[Q]uit all (exit nvim)' })
vim.keymap.set('n', '<leader>qQ', '<cmd>qa!<cr>', { desc = '[Q]uit all (discard unsaved)' })
vim.keymap.set('n', '<leader>qw', '<cmd>wqa<cr>', { desc = '[Q]uit all [W]rite and exit' })

-- Diagnostic quickfix list
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode with double Esc
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Remind to use hjkl instead of arrows (optional; comment out if you prefer arrows)
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Window navigation: Ctrl+h/j/k/l to focus left/down/up/right
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Resize splits: + and - (with leader). Focus the pane first, then use these.
vim.keymap.set('n', '<leader>+', '<cmd>vertical resize +5<cr>', { desc = 'Resize wider (+)' })
vim.keymap.set('n', '<leader>-', '<cmd>vertical resize -5<cr>', { desc = 'Resize narrower (-)' })
vim.keymap.set('n', '<leader>w=', '<cmd>wincmd =<cr>', { desc = '[W]indow equal size' })

-- Tab: open, close, navigate
vim.keymap.set('n', '<leader>tn', '<cmd>tabnew<cr>', { desc = '[T]ab [N]ew' })
vim.keymap.set('n', '<leader>tc', '<cmd>tabclose<cr>', { desc = '[T]ab [C]lose' })
vim.keymap.set('n', '<leader>to', '<cmd>tabonly<cr>', { desc = '[T]ab [O]nly (close others)' })
vim.keymap.set('n', '<Tab>', '<cmd>tabnext<cr>', { desc = 'Next tab' })
vim.keymap.set('n', '<S-Tab>', '<cmd>tabprev<cr>', { desc = 'Previous tab' })
vim.keymap.set('n', '<leader>1', '<cmd>tabn 1<cr>', { desc = 'Go to tab 1' })
vim.keymap.set('n', '<leader>2', '<cmd>tabn 2<cr>', { desc = 'Go to tab 2' })
vim.keymap.set('n', '<leader>3', '<cmd>tabn 3<cr>', { desc = 'Go to tab 3' })
vim.keymap.set('n', '<leader>4', '<cmd>tabn 4<cr>', { desc = 'Go to tab 4' })
vim.keymap.set('n', '<leader>5', '<cmd>tabn 5<cr>', { desc = 'Go to tab 5' })
vim.keymap.set('n', '<leader>0', '<cmd>tablast<cr>', { desc = 'Go to last tab' })
