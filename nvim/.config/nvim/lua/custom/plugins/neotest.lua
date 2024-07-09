return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    'nvim-neotest/neotest-jest',
  },
  config = function()
    require("neotest").setup {
      adapters = {
        require('neotest-jest')({
          jestCommand = "npm test --",
          jestConfigFile = "jest.config.js",
          env = { CI = true },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        }),
      }
    }
  end,
  keys = {
    { "<leader>tw", "<cmd>lua require('neotest').run.run({jestCommand = 'jest --watch'})<cr>", desc = "Watch Jest Tests", silent = true },
    {
      "<leader>tr",
      function()
        local neotest = require('neotest')
        neotest.run.run()
        neotest.output_panel.open()
      end,
      desc = "Run nearest test",
      silent = true
    },
    { "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>",             desc = "Run file",         silent = true },
  }
}
