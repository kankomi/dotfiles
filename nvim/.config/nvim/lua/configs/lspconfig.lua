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
    filetypes = { "html", "templ", "css", "rs" },
  },
  htmx = {
    filetypes = { "html", "templ" },
  },
  ts_ls = {},
  svelte = {},
  emmet_language_server = {
    filetypes = { "html", "templ", "rs" },
  },
  pyright = {},
  -- rust_analyzer = {
  --   filetypes = { "rust" },
  --   root_dir = util.root_pattern "Cargo.toml",
  --   settings = {
  --     ["rust_analyzer"] = {
  --       cargo = {
  --         allFeatures = true,
  --       },
  --       checkOnSave = {
  --         features = { "ssr" },
  --         command = "clippy",
  --       },
  --     },
  --     procMacro = {
  --       ignored = {
  --         leptos_macro = {
  --           -- "component",
  --           "server",
  --         },
  --       },
  --     },
  --   },
  -- },
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

for _, method in ipairs { "textDocument/diagnostic", "workspace/diagnostic" } do
  local default_diagnostic_handler = vim.lsp.handlers[method]
  vim.lsp.handlers[method] = function(err, result, context, config)
    if err ~= nil and err.code == -32802 then
      return
    end
    return default_diagnostic_handler(err, result, context, config)
  end
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
