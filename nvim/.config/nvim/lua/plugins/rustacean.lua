return {
  "mrcjkb/rustaceanvim",
  version = "^5", -- Recommended
  lazy = false, -- This plugin is already lazy
  keys = {
    { "<leader>ca", "<cmd>RustLsp codeAction<cr>" },
  },
}
