-- https://github.com/stevearc/conform.nvim

local options = {
  formatters_by_ft = {
    ["*"] = { "trim_newlines", "trim_whitespace" },
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

return options
