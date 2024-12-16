return {
  {
    "mfussenegger/nvim-dap",
    enabled = true,
    dependencies = {
      "nvim-neotest/nvim-nio",
      "rcarriga/nvim-dap-ui",
      "leoluz/nvim-dap-go",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      local dap, dapui = require "dap", require "dapui"
      local dapgo = require "dap-go"
      dapui.setup()
      dapgo.setup()

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      -- dap.listeners.before.event_terminated.dapui_config = function()
      --   dapui.close()
      -- end
      -- dap.listeners.before.event_exited.dapui_config = function()
      --   dapui.close()
      -- end
    end,
    keys = {
      {
        "<leader>dc",
        function()
          require("dap").continue()
        end,
        desc = "Debug Continue",
      },
      {
        "<leader>do",
        function()
          require("dap").step_over()
        end,
        desc = "Debug Step Over",
      },
      {
        "<leader>di",
        function()
          require("dap").step_into()
        end,
        desc = "Debug Step Into",
      },
      {
        "<leader>dq",
        function()
          require("dap").step_out()
        end,
        desc = "Debug Step Out",
      },
      {
        "<Leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Debug Toggle Breakpoint",
      },
      {
        "<Leader>lp",
        function()
          require("dap").set_breakpoint(nil, nil, vim.fn.input "Log point message: ")
        end,
        desc = "Debug Set Log Point",
      },
      {
        "<Leader>dr",
        function()
          require("dap").repl.open()
        end,
        desc = "Debug Open Repl",
      },
      {
        "<Leader>dl",
        function()
          require("dap").run_last()
        end,
        desc = "Debug Run Last",
      },
      {
        "<Leader>dw",
        function()
          require("dapui").open()
        end,
        desc = "Debug Open UI",
      },
      {
        "<Leader>dW",
        function()
          require("dapui").close()
        end,
        desc = "Debug Close UI",
      },
    },
  },
}
