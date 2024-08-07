-- https://github.com/folke/lazy.nvim/blob/main/README.md#-plugin-spec

return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = require "configs.mason"
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "configs.treesitter"
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
    opts = "configs.undotree"
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
    opts = require "configs.copilot"
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
    opts = require "configs.copilotchat"
  },

  {
    "eandrju/cellular-automaton.nvim",
    keys = {
      { "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>", desc = "random make it rain" },
    },
  },
}
