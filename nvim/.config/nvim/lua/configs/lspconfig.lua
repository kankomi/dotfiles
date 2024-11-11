-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local util = require "lspconfig.util"

local nvlsp = require "nvchad.configs.lspconfig"
local servers = {
  gopls = {},
  terraformls = { "tf" },
  templ = {},
  tailwindcss = {
    filetypes = { "html", "templ", "css" },
  },
  htmx = {
    filetypes = { "html", "templ" },
  },
  ts_ls = {},
  svelte = {},
  emmet_language_server = {
    filetypes = { "html", "templ" },
  },
  pyright = {},
  rust_analyzer = {
    filetypes = { "rust" },
    root_dir = util.root_pattern "Cargo.toml",
    settings = {
      ["rust_analyzer"] = {
        cargo = {
          allFeatures = true,
        },
      },
    },
  },
  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = "Replace",
        },
      },
    },
  },
}

-- lsps with default config
for name, opts in pairs(servers) do
  opts.on_init = nvlsp.on_init
  opts.on_attach = nvlsp.on_attach
  opts.capabilities = nvlsp.capabilities

  require("lspconfig")[name].setup(opts)
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
