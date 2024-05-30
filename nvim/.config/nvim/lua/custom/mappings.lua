-- General
vim.keymap.set('n', '<leader>rw', 'yiw:%s/<C-r>"//gc<Left><Left><Left>', { desc = 'Replace word' })
vim.keymap.set('v', '<leader>rw', 'y:%s/<C-r>"//gc<Left><Left><Left>', { desc = 'Replace highlighted text' })
vim.keymap.set('n', ';', ':', { desc = 'Open command line' })
vim.keymap.set('i', 'jj', '<esc>', { desc = 'Return to normal mode' })
vim.keymap.set('n', '<C-s>', '<cmd> w<cr>', { desc = 'Save file' })
vim.keymap.set('n', '<M-v>', '<C-v>', { desc = 'Visual Block Mode' })
vim.keymap.set('n', '<leader>y', '<C-">+y', { desc = 'Yank to clipboard', silent = true })
vim.keymap.set('v', '<leader>y', '<C-">+y', { desc = 'Yank to clipboard', silent = true })
vim.keymap.set('n', '<leader>p', '<C-">*p', { desc = 'Paste from clipboard', silent = true })
vim.keymap.set('n', '<M-j>', '<cmd>cnext<cr>', { desc = 'CNext', silent = true })
vim.keymap.set('n', '<M-k>', '<cmd>cprevious<cr>', { desc = 'CPrev', silent = true })

-- Conform
vim.keymap.set('n', '<leader>fm', function()
  local bufnr = vim.api.nvim_get_current_buf()
  require('conform').format { bufnr = bufnr }
end, { desc = 'Format current buffer' })
