-- https://github.com/stevearc/conform.nvim/blob/master/README.md#formatters

local options = {
  formatters_by_ft = {
    -- All
    ["*"] = { "codespell", "trim_newlines", "trim_whitespace" },
    -- Bash
    -- CSS
    css = { "prettier" },
    -- Docker
    -- Go
    go = { "gofmt", "golines", "goimports" },
    -- HTML
    html = { "prettier" },
    -- JavaScript
    javascript = { "prettier" },
    -- JSON
    json = { "prettier" },
    -- Lua
    lua = { "stylua" },
    -- Make
    -- Markdown
    markdown = {},
    -- Python
    python = { "ruff_format" },
    -- reStructuredText
    -- TOML
    -- Terraform, OpenTofu
    -- https://opentofu.org/docs/cli/commands/fmt/
    -- Text
    -- XML
    -- https://github.com/pamoller/xmlformatter
    -- https://gnome.pages.gitlab.gnome.org/libxml2/xmllint.html
    --
    -- YAML
    -- https://github.com/lyz-code/yamlfix
    -- https://github.com/google/yamlfmt
    --
    -- YAML, JSON, XML, Properties, CSV, TSV, TOML
    -- https://github.com/mikefarah/yq
    yaml = { "prettier" },
  },

  format_on_save = {
    lsp_fallback = true,
    timeout_ms = 500,
  },
}

require("conform").setup(options)
