-- https://github.com/mfussenegger/nvim-lint

local markdownlint = require("lint").linters.markdownlint
markdownlint.args = {
  "--disable",
  "MD013", -- Line length (80 chars), because semantic linefeeds.
  "--",
}

require("lint").linters_by_ft = {
  css = { "stylelint" },
  dockerfile = { "hadolint" },
  go = { "golangcilint" },
  html = { "markuplint" },
  javascript = { "biome", "jshint" },
  json = { "jsonlint" },
  make = { "checkmake" },
  markdown = { "markdownlint" },
  python = { "bandit", "mypy", "ruff", "vulture" },
  rego = { "opa_check", "regal" },
  rst = { "rstcheck", "rstlint" },
  sh = { "shellcheck" },
  sql = { "sqlfluff" },
  systemd = { "systemdlint" },
  terraform = { "tflint", "trivy" },
  typescript = { "biome" },
  yaml = { "yamllint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
