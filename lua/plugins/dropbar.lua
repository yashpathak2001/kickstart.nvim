--[[ Dropbar: IDE-like breadcrumbs at the top of each buffer. ]]
return {
  {
    'Bekaboo/dropbar.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      menu = {
        keymaps = {
          ['<Esc>'] = 'close',
          ['q'] = 'close',
          ['<CR>'] = 'pick',
          ['<Tab>'] = 'next',
          ['<S-Tab>'] = 'prev',
        },
      },
      bar = {
        pick = { pivot_icon = '' },
        truncate = true,
        -- Don't attach to tiny/floating windows (e.g. neo-tree paste input) to avoid E36
        enable = function(buf, win)
          buf = vim._resolve_bufnr(buf)
          if not vim.api.nvim_buf_is_valid(buf) or not vim.api.nvim_win_is_valid(win) then
            return false
          end
          local h = vim.api.nvim_win_get_height(win)
          local cfg = vim.api.nvim_win_get_config(win)
          if h <= 2 or (cfg.relative and cfg.relative ~= '') then
            return false
          end
          if vim.fn.win_gettype(win) ~= '' or vim.wo[win].winbar ~= '' or vim.bo[buf].ft == 'help' then
            return false
          end
          local stat = vim.uv.fs_stat(vim.api.nvim_buf_get_name(buf))
          if stat and stat.size > 1024 * 1024 then
            return false
          end
          return vim.bo[buf].buftype == 'terminal'
            or vim.bo[buf].ft == 'markdown'
            or pcall(vim.treesitter.get_parser, buf)
            or not vim.tbl_isempty(vim.lsp.get_clients({ bufnr = buf, method = 'textDocument/documentSymbol' }))
        end,
      },
      -- Use default sources (path + LSP/treesitter symbol); do not set sources.path/symbol to booleans
    },
    config = function(_, opts)
      require('dropbar').setup(opts)
      local api = require('dropbar.api')
      vim.keymap.set('n', '<leader>;', api.pick, { desc = 'Dropbar: pick symbol' })
      vim.keymap.set('n', '[;', api.goto_context_start, { desc = 'Dropbar: start of context' })
      vim.keymap.set('n', '];', api.select_next_context, { desc = 'Dropbar: next context' })
    end,
  },
}
