-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

vim.api.nvim_create_autocmd("DiagnosticChanged", {
  callback = function()
    vim.diagnostic.setloclist { open = false }
  end,
})

local lspconfig = require "lspconfig"
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

-- Bash
lspconfig.bashls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- CSS
lspconfig.cssls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- Docker
lspconfig.dockerls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}
lspconfig.docker_compose_language_service.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- Go
lspconfig.gopls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}
lspconfig.golangci_lint_ls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- HTML
lspconfig.html.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- JavaScript
lspconfig.eslint.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- JSON
lspconfig.jsonls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- Lua
lspconfig.lua_ls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
}

-- Markdown
lspconfig.marksman.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- Python
lspconfig.pylsp.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}
lspconfig.pyright.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "strict",
        useLibraryCodeForTypes = true,
      },
    },
  },
}
lspconfig.ruff_lsp.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- TOML
lspconfig.taplo.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- Terraform
lspconfig.terraformls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}
lspconfig.tflint.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- Text
lspconfig.vale_ls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- XML
lspconfig.lemminx.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- YAML
lspconfig.yamlls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}
