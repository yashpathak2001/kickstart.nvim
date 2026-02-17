--[[
  Colorscheme: Catppuccin Mocha – very dark, transparent background.
  For blur effect: enable transparency + blur in your terminal (e.g. iTerm2, Kitty, WezTerm, Alacritty).
]]
return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup({
        flavour = 'mocha',
        background = { light = 'latte', dark = 'mocha' },
        transparent_background = true,
        show_end_of_buffer = false,
        term_colors = true,
        dim_inactive = { enabled = false },
        no_italic = true,
        no_bold = false,
        styles = {
          comments = {},
          conditionals = {},
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        -- Darker base when any non-transparent UI is used (floats, etc.)
        color_overrides = {
          mocha = {
            base = '#060608',
            mantle = '#040406',
            crust = '#020203',
          },
        },
        highlight_overrides = {
          mocha = function(cp)
            return {
              -- Main buffer: no background so terminal transparency/blur shows through
              Normal = { bg = 'NONE' },
              NormalNC = { bg = 'NONE' },
              SignColumn = { bg = 'NONE' },
              -- Tildes (~) and empty lines: bright gray
              EndOfBuffer = { bg = 'NONE', fg = cp.overlay1 },
              NonText = { bg = 'NONE', fg = cp.overlay1 },
              -- Line numbers: bright, current line even brighter
              LineNr = { bg = 'NONE', fg = cp.overlay1 },
              CursorLineNr = { bg = 'NONE', fg = cp.text },
              Folded = { bg = 'NONE', fg = cp.overlay1 },
              -- Pane dividers: bright so splits are clear
              VertSplit = { bg = 'NONE', fg = cp.overlay2 },
              WinSeparator = { bg = 'NONE', fg = cp.overlay2 },
              -- Neo-tree: "(X hidden items)" and other dim text
              NeoTreeMessage = { bg = 'NONE', fg = cp.overlay2 },
              NeoTreeDimText = { bg = 'NONE', fg = cp.overlay2 },
              StatusLine = { bg = 'NONE' },
              StatusLineNC = { bg = 'NONE' },
              TabLine = { bg = 'NONE' },
              TabLineFill = { bg = 'NONE' },
              -- Floats/popups: very dark so they stay readable over transparent area
              NormalFloat = { bg = cp.mantle },
              FloatBorder = { bg = cp.mantle },
              Pmenu = { bg = cp.mantle },
              PmenuSel = { bg = cp.surface0 },
            }
          end,
        },
        integrations = {
          aerial = true,
          cmp = true,
          dap = true,
          dap_ui = true,
          gitsigns = true,
          indent_blankline = true,
          native_lsp = { enabled = true },
          neotree = true,
          noice = true,
          notify = true,
          telescope = true,
          treesitter = true,
          which_key = true,
        },
      })
      vim.cmd.colorscheme('catppuccin-mocha')
    end,
  },
}
