--[[ Treesitter: syntax highlighting and parsing (function names, etc.). ]]
return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    opts = {
      ensure_installed = {
        'bash', 'c', 'cpp', 'css', 'diff', 'html', 'javascript', 'json', 'lua', 'luadoc',
        'markdown', 'markdown_inline', 'python', 'query', 'tsx', 'typescript', 'vim', 'vimdoc',
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
    config = function(_, opts)
      require('nvim-treesitter').setup(opts)
    end,
  },
}
