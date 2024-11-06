return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'theHamsta/nvim-dap-virtual-text',
    'Weissle/persistent-breakpoints.nvim',
    'leoluz/nvim-dap-go',
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio'
  },
  config = function()
    local dap, ui = require 'dap', require 'dapui'
    dap.adapters.go = {
      type = 'executable',
      command = 'node',
      args = { vim.fn.stdpath 'data' .. '/mason/bin/go-debug-adapter' },
    }

    require('dap-go').setup({
      dap_configrations = { {
        type = 'go',
        name = 'Debug',
        request = 'launch',
        showLog = true,
        program = '${workspaceFolder}/main.go',
        dlvToolPath = vim.fn.exepath 'dlv', -- Adjust to where delve is installed
      },
      },
      delve = {
        build_flags = "-tags prod",
      }
    })
    require('nvim-dap-virtual-text').setup {}
    vim.g.dap_virtual_text = true

    require('persistent-breakpoints').setup {
      load_breakpoints_event = { 'BufReadPost' },
    }
    ui.setup()
    dap.listeners.after.event_initialized['dapui_config'] = function()
      ui.open()
    end
    dap.listeners.before.event_terminated['dapui_config'] = function()
      ui.close()
    end
    dap.listeners.before.event_exited['dapui_config'] = function()
      ui.close()
    end

    vim.fn.sign_define('DapBreakpoint', { text = '🟥', texthl = '', linehl = '', numhl = '' })
    vim.fn.sign_define('DapStopped', { text = '▶️', texthl = '', linehl = '', numhl = '' })
  end,
  keys = {
    {
      '<leader>db',
      function()
        require('dap').toggle_breakpoint()
      end,
      desc = 'Toggle Breakpoint',
    },
    {
      '<leader>dt',
      function()
        require('dapui').toggle()
      end,
      desc = 'Toggle Debug UI',
    },
    {
      '<leader>dr',
      function()
        require('dap').run_to_cursor()
      end,
      desc = 'Run to cursor'
    },
    {
      '<F1>',
      function()
        require('dap').continue()
      end,
      desc = 'Debug Continue',
    },
    {
      '<F2>',
      function()
        require('dap').step_into()
      end,
      desc = 'Debut Step Into',
    },
    {
      '<F3>',
      function()
        require('dap').step_over()
      end,
      desc = 'Debug Step Over',
    },
    {
      '<F4>',
      function()
        require('dap').step_out()
      end,
      desc = 'Debug Step Out',
    },
    {
      '<F9>',
      function()
        require('dap').restart()
      end,
      desc = 'Debug Restart',
    },
    {
      '<F10>',
      function()
        require('dap').close()
        require('dapui').close()
      end,
      desc = 'Debug Stop',
    },
  },
}
