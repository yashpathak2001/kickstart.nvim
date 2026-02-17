--[[ Conform: format on save and <leader>f. Formatters for Python, HTML, CSS, JS, C/C++, Java, C#, Lua, JSON, XML. ]]
return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format({ async = true, lsp_format = 'fallback' })
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = { timeout_ms = 500, lsp_format = 'fallback' },
      formatters_by_ft = {
        python = { 'ruff_format' },
        html = { 'prettierd', 'prettier' },
        htmldjango = { 'prettierd', 'prettier' },
        css = { 'prettierd', 'prettier' },
        scss = { 'prettierd', 'prettier' },
        javascript = { 'prettierd', 'prettier' },
        javascriptreact = { 'prettierd', 'prettier' },
        typescript = { 'prettierd', 'prettier' },
        typescriptreact = { 'prettierd', 'prettier' },
        json = { 'prettierd', 'prettier', 'fixjson' },
        jsonc = { 'prettierd', 'prettier' },
        c = { 'clang_format' },
        cpp = { 'clang_format' },
        java = { 'google_java_format' },
        lua = { 'stylua' },
        xml = { 'prettierd', 'prettier' },
        cs = {}, -- use LSP format (fallback)
      },
    },
  },
}
