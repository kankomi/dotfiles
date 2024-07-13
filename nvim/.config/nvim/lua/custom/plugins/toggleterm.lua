return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup(
      {
        open_mapping = [[<c-p>]]
      }
    )
  end,
  -- keys = {
  --   { "<C-p>", "<cmd>ToggleTerm<cr>", desc = "Toggle term" }
  -- }
}
