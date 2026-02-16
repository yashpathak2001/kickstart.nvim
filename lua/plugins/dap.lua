--[[ Debugger: nvim-dap + nvim-dap-ui + mason-nvim-dap. Python, C/C++, C#, Java. ]]
return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
      { 'mason-org/mason.nvim', opts = {} },
      'jay-babu/mason-nvim-dap.nvim',
    },
    keys = {
      { '<F5>', function() require('dap').continue() end, desc = 'Debug: Start/Continue' },
      { '<F9>', function() require('dap').toggle_breakpoint() end, desc = 'Debug: Toggle breakpoint' },
      { '<F10>', function() require('dap').step_over() end, desc = 'Debug: Step over' },
      { '<F11>', function() require('dap').step_into() end, desc = 'Debug: Step into' },
      { '<F12>', function() require('dap').step_out() end, desc = 'Debug: Step out' },
      { '<leader>db', function() require('dap').toggle_breakpoint() end, desc = '[D]ebug [B]reakpoint' },
      { '<leader>dB', function() require('dap').set_breakpoint(vim.fn.input('Condition: ')) end, desc = '[D]ebug conditional [B]reakpoint' },
      { '<leader>dc', function() require('dap').continue() end, desc = '[D]ebug [C]ontinue' },
      { '<leader>dq', function() require('dap').terminate() end, desc = '[D]ebug [Q]uit' },
      { '<leader>du', function() require('dapui').toggle() end, desc = '[D]ebug [U]I toggle' },
    },
    config = function()
      local dap = require('dap')
      local dapui = require('dapui')

      require('mason-nvim-dap').setup({
        automatic_installation = true,
        ensure_installed = { 'debugpy', 'codelldb', 'coreclr', 'java-debug-adapter' },
        handlers = {},
      })
      require('mason-nvim-dap').setup_handlers({})

      dapui.setup({
        icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
        controls = {
          icons = {
            pause = '⏸',
            play = '▶',
            step_into = '⏎',
            step_over = '⏭',
            step_out = '⏮',
            run_last = '▶▶',
            terminate = '⏹',
            disconnect = '⏏',
          },
        },
      })

      dap.listeners.after.event_initialized['dapui_config'] = dapui.open
      dap.listeners.before.event_terminated['dapui_config'] = dapui.close
      dap.listeners.before.event_exited['dapui_config'] = dapui.close
    end,
  },
}
