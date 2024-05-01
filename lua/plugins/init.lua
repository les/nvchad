-- https://github.com/folke/lazy.nvim/blob/main/README.md#-plugin-spec

return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
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
        "autotools-language-server",
        "bash-language-server",
        "biome",
        "cbfmt",
        "checkmake",
        "codespell",
        "css-lsp",
        "delve",
        "deno",
        "docker-compose-language-service",
        "dockerfile-language-server",
        "eslint-lsp",
        "firefox-debug-adapter",
        "fixjson",
        "gci",
        "glow",
        "go-debug-adapter",
        "gofumpt",
        "goimports",
        "goimports-reviser",
        "golangci-lint",
        "golangci-lint-langserver",
        "golines",
        "gomodifytags",
        "gopls",
        "gospel",
        "gotests",
        "gotestsum",
        "hadolint",
        "html-lsp",
        "iferr",
        "impl",
        "jq",
        "js-debug-adapter",
        "json-lsp",
        "json-to-struct",
        "jsonlint",
        "lemminx",
        "lua-language-server",
        "luacheck",
        "markdownlint",
        "markdownlint-cli2",
        "markmap-cli",
        "marksman",
        "mdformat",
        "nilaway",
        "oxlint",
        "prettier",
        "proselint",
        "pyright",
        "python-lsp-server",
        "quick-lint-js",
        "remark-language-server",
        "revive",
        "rstcheck",
        "ruff",
        "ruff-lsp",
        "selene",
        "shfmt",
        "standardjs",
        "staticcheck",
        "stylelint",
        "stylelint-lsp",
        "stylua",
        "taplo",
        "templ",
        "terraform-ls",
        "textlint",
        "tflint",
        "tfsec",
        "vale",
        "vale-ls",
        "write-good",
        "xmllint",
        "yaml-language-server",
        "yamlfix",
        "yamlfmt",
        "yamllint",
        "yq",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "comment",
        "css",
        "csv",
        "diff",
        "dockerfile",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "go",
        "gomod",
        "gosum",
        "gotmpl",
        "gowork",
        "hcl",
        "html",
        "ini",
        "javascript",
        "json",
        "lua",
        "luadoc",
        "luap",
        "make",
        "markdown",
        "markdown_inline",
        "mermaid",
        "python",
        "requirements",
        "rst",
        "sql",
        "terraform",
        "toml",
        "tsv",
        "xml",
        "yaml",
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    enabled = true,
    event = "VeryLazy",
    config = function()
      require("lint").linters_by_ft = {
        css = { "stylelint" },
        dockerfile = { "hadolint" },
        go = { "golangcilint", "revive" },
        html = { "htmlhint", "markuplint" },
        javascript = { "biome", "jshint" },
        json = { "jsonlint" },
        lua = { "luacheck" },
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
    end,
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

  --[[
  -- Peek was a little buggy.
  {
    "toppair/peek.nvim",
    ft = { "markdown" },
    build = "deno task --quiet build:fast",
    config = function()
      require "configs.peek"
    end,
  },
  --]]

  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    keys = {
      { "<leader>mp", "<cmd>MarkdownPreview<cr>", desc = "markdown preview" },
    },
    build = function()
      vim.cmd [[Lazy load markdown-preview.nvim]]
      vim.fn["mkdp#util#install"]()
    end,
    init = function()
      vim.g.mkdp_auto_close = 0
      vim.g.mkdp_auto_start = 1
      vim.g.mkdp_browser = "firefox"
      vim.g.mkdp_combine_preview = 1
      vim.g.mkdp_page_title = "${name}.md"
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
    keys = {
      { "<Leader>cp", "<cmd>CopilotChatToggle<cr>", mode = { "n", "v" }, desc = "copilot toggle chat window" },
    },
    config = function()
      require "configs.copilotchat"
    end,
  },

  {
    "eandrju/cellular-automaton.nvim",
    keys = {
      { "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>", desc = "random make it rain" },
    },
  },
}
