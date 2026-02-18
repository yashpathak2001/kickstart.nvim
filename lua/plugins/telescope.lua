--[[ Telescope fuzzy finder. Keymaps and LSP pickers here. See :help telescope. ]]
return {
  {
    'nvim-telescope/telescope.nvim',
    enabled = true,
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable('make') == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      require('telescope').setup({
        defaults = {
          -- Reserve space so opening the picker doesn't trigger E36 "Not enough room" on BufEnter
          layout_config = {
            height = 0.85,
            width = 0.85,
          },
        },
        extensions = {
          ['ui-select'] = { require('telescope.themes').get_dropdown() },
        },
      })
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      local builtin = require('telescope.builtin')
      -- Wrap picker so BufEnter is ignored when plenary opens the window (avoids E36)
      local function safe_picker(fn)
        return function(...)
          local prev = vim.opt.eventignore:get()
          vim.opt.eventignore:append('BufEnter')
          fn(...)
          vim.defer_fn(function()
            vim.opt.eventignore = prev
          end, 100)
        end
      end
      vim.keymap.set('n', '<leader>sh', safe_picker(builtin.help_tags), { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', safe_picker(builtin.keymaps), { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', safe_picker(function()
        builtin.find_files({ hidden = true })
      end), { desc = '[S]earch [F]iles (including dotfiles)' })
      vim.keymap.set('n', '<leader>ss', safe_picker(builtin.builtin), { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set({ 'n', 'v' }, '<leader>sw', safe_picker(builtin.grep_string), { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', safe_picker(builtin.live_grep), { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', safe_picker(builtin.diagnostics), { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', safe_picker(builtin.resume), { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', safe_picker(builtin.oldfiles), { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader>sc', safe_picker(builtin.commands), { desc = '[S]earch [C]ommands' })
      vim.keymap.set('n', '<leader><leader>', safe_picker(builtin.buffers), { desc = '[ ] Find existing buffers' })

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('telescope-lsp-attach', { clear = true }),
        callback = function(event)
          local buf = event.buf
          vim.keymap.set('n', 'grr', safe_picker(builtin.lsp_references), { buffer = buf, desc = '[G]oto [R]eferences' })
          vim.keymap.set('n', 'gri', safe_picker(builtin.lsp_implementations), { buffer = buf, desc = '[G]oto [I]mplementation' })
          vim.keymap.set('n', 'grd', safe_picker(builtin.lsp_definitions), { buffer = buf, desc = '[G]oto [D]efinition' })
          vim.keymap.set('n', 'gO', safe_picker(builtin.lsp_document_symbols), { buffer = buf, desc = 'Open Document Symbols' })
          vim.keymap.set('n', 'gW', safe_picker(builtin.lsp_dynamic_workspace_symbols), { buffer = buf, desc = 'Open Workspace Symbols' })
          vim.keymap.set('n', 'grt', safe_picker(builtin.lsp_type_definitions), { buffer = buf, desc = '[G]oto [T]ype Definition' })
        end,
      })

      vim.keymap.set('n', '<leader>/', safe_picker(function()
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
          winblend = 10,
          previewer = false,
        }))
      end), { desc = '[/] Fuzzily search in current buffer' })

      vim.keymap.set('n', '<leader>s/', safe_picker(function()
        builtin.live_grep({
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        })
      end), { desc = '[S]earch [/] in Open Files' })

      vim.keymap.set('n', '<leader>sn', safe_picker(function()
        builtin.find_files({ cwd = vim.fn.stdpath('config'), hidden = true })
      end), { desc = '[S]earch [N]eovim config files' })
    end,
  },
}
