-- https://github.com/neovim/nvim-lspconfig

require("nvchad.configs.lspconfig").defaults()

local servers = {
  awk_ls = {},
  bashls = {},
  cssls = {},
  docker_compose_language_service = {},
  dockerls = {},
  eslint = {},
  golangci_lint_ls = {},
  gopls = {},
  html = {},
  jsonls = {},
  lemminx = {},
  marksman = {},
  pylsp = {},
  ruff_lsp = {},
  taplo = {},
  terraformls = {},
  tflint = {},
  vale_ls = {},
  yamlls = {},

  pyright = {
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          typeCheckingMode = "strict",
          useLibraryCodeForTypes = true,
        },
      },
    },
  },

  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  },
}

local configs = require "nvchad.configs.lspconfig"

for name, opts in pairs(servers) do
  opts.on_init = configs.on_init
  opts.on_attach = configs.on_attach
  opts.capabilities = configs.capabilities

  require("lspconfig")[name].setup(opts)
end

vim.api.nvim_create_autocmd("DiagnosticChanged", {
  callback = function()
    vim.diagnostic.setloclist { open = false }
  end,
})
