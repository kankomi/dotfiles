return {
  'github/copilot.vim',
  lazy = false,
  config = function()
    vim.g.copilot_no_tab_map = true

    vim.keymap.set('i', '<C-k>', 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false
    })
  end,
  keys = {
    { mode = 'i', '<esc>', '<Plug>(copilot-dismiss)',     desc = 'Dismiss copilot suggestion' },
    { mode = 'i', '<M-ä>', '<Plug>(copilot-next)',        desc = 'Next suggestion' },
    { mode = 'i', '<M-ö>', '<Plug>(copilot-previous)',    desc = 'Previous suggestion' },
    { mode = 'i', '<M-c>', '<Plug>(copilot-suggest)',     desc = 'Suggest completion' },
    { mode = 'i', '<C-L>', '<Plug>(copilot-accept-word)', desc = 'Accept word' },
  },
}
