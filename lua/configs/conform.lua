-- https://github.com/stevearc/conform.nvim/blob/master/README.md#formatters

local options = {
  formatters_by_ft = {
    ["*"] = { "codespell", "trim_newlines", "trim_whitespace" },
    sh = { "shfmt" },
    css = { "prettier" },
    go = { "gofmt", "golines", "goimports" },
    html = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    json = { "prettier" },
    lua = { "stylua" },
    markdown = {},
    python = { "ruff_format" },
    yaml = { "prettier" },
  },

  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  },
}

require("conform").setup(options)
