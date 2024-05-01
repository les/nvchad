-- https://github.com/folke/lazy.nvim/blob/main/README.md#-plugin-spec

return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require "configs.conform"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Bash
        "bash-language-server", -- Language server

        -- CSS
        "css-lsp", -- Language server
        -- "stylelint",
        -- "stylelint-lsp",

        -- Docker
        "dockerfile-language-server", -- Language server
        "docker-compose-language-service", -- Language server
        -- "hadolint",

        -- Go
        "gopls", -- Language server
        "golangci-lint-langserver", -- Language server
        "golines",
        "goimports",
        -- "delve",
        -- "gci",
        -- "go-debug-adapter",
        -- "gofumpt",
        -- "goimports-reviser",
        -- "golangci-lint",
        -- "gomodifytags",
        -- "gospel",
        -- "gotests",
        -- "gotestsum",
        -- "iferr",
        -- "impl",
        -- "json-to-struct",
        -- "nilaway",
        -- "revive",
        -- "staticcheck",
        -- "templ",

        -- HTML
        "html-lsp", -- Language server

        -- HTML, CSS, JavaScript, Markdown, YAML, ...
        "prettier", -- Formatter

        -- JavaScript
        "eslint-lsp", -- Language server
        -- "biome",
        -- "firefox-debug-adapter",
        -- "js-debug-adapter",
        -- "oxlint",
        -- "quick-lint-js",
        -- "standardjs",

        -- JSON
        "json-lsp", -- Language server
        -- "fixjson",
        -- "jq",
        -- "jsonlint",

        -- Lua
        "lua-language-server", -- Language server
        "stylua", -- Formatter
        -- "luacheck",
        -- "selene",

        -- Make
        -- "autotools-language-server",
        -- "checkmake",

        -- Markdown
        "marksman", -- Language server
        -- "cbfmt",
        -- "glow",
        -- "markdownlint",
        -- "markdownlint-cli2",
        -- "markmap-cli",
        -- "mdformat",
        -- "remark-language-server",

        -- Python
        "python-lsp-server", -- Language server
        "pyright", -- Language server
        "ruff-lsp", -- Language server
        "ruff", -- Linter and formatter

        -- reStructuredText
        -- "rstcheck",

        -- TOML
        "taplo", -- Language server

        -- Terraform
        "terraform-ls", -- Language server
        "tflint", -- Language server
        -- "tfsec",

        -- Text
        "vale-ls", -- Language server
        -- "proselint",
        -- "textlint",
        -- "vale",
        -- "write-good",
        "codespell", -- Linter

        -- XML
        "lemminx", -- Language server
        -- "xmllint",

        -- YAML
        "yaml-language-server", -- Language server
        -- "yamlfix",
        -- "yamlfmt",
        -- "yamllint",
        -- "yq",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- Bash
        -- "bash",

        -- CSS
        -- "css",

        -- Docker
        -- "dockerfile",

        -- Go
        -- "go",
        -- "gomod",
        -- "gosum",
        -- "gotmpl",
        -- "gowork",

        -- HTML
        "html",

        -- JSON
        -- "json",

        -- JavaScript
        -- "javascript",

        -- Lua
        "lua",
        "luadoc",
        "luap",

        -- Make
        -- "make",

        -- Markdown
        -- "markdown",
        -- "markdown_inline",
        -- "mermaid",

        -- Python
        "python",
        "requirements",

        -- reStructuredText
        -- "rst",

        -- TOML
        -- "toml",

        -- Terraform
        -- "hcl",
        -- "terraform",

        -- Text
        -- "comment",

        -- XML
        -- "xml",

        -- YAML
        -- "yaml",

        -- Misc.
        -- "csv",
        -- "diff",
        -- "git_config",
        -- "git_rebase",
        -- "gitattributes",
        -- "gitcommit",
        -- "gitignore",
        -- "ini",
        -- "sql",
        -- "tsv",
      },
    },
  },

  {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    keys = {
      { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>", desc = "undotree toggle" },
    },
    config = function()
      require "configs.undotree"
    end,
  },

  {
    "eandrju/cellular-automaton.nvim",
    keys = {
      { "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>", desc = "random fuck my life" },
    },
  },

  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require "configs.copilot"
    end,
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
      { "zbirenbaum/copilot.lua" },
    },
    cmd = "CopilotChatToggle",
    config = function()
      require "configs.copilotchat"
    end,
  },
}
