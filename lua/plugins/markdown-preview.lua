--[[ Markdown preview: render .md in-buffer (headings, code, tables, etc.) and optional side preview. ]]
return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = 'markdown',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    keys = {
      { '<leader>mv', '<cmd>RenderMarkdown preview<cr>', desc = '[M]arkdown [V]iew (preview in split)' },
      { '<leader>mt', '<cmd>RenderMarkdown toggle<cr>', desc = '[M]arkdown [T]oggle rendered/raw' },
    },
    opts = {
      enabled = true,
      file_types = { 'markdown' },
      render_modes = { 'n', 'c', 't' },
    },
  },
}
