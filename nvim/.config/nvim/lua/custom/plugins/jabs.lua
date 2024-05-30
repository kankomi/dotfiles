return {
  'matbme/JABS.nvim',
  config = function()
    require('jabs').setup()
  end,
  keys = {
    { '<C-e>', '<cmd>JABSOpen<cr>', { desc = 'Open buffer list', silent = true } },
    { '<leader>x', '<cmd>bd<cr>', { desc = 'Close buffer', silent = true } },
  },
}
