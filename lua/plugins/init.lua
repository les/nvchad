-- https://lazy.folke.io/spec

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
    opts = require "configs.mason",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "configs.treesitter",
  },

  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "configs.lint"
    end,
  },

  {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    keys = {
      { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>", desc = "undotree toggle" },
    },
    opts = "configs.undotree",
  },

  --[[
  -- Peek was a little buggy.
  {
    "toppair/peek.nvim",
    ft = { "markdown" },
    build = "deno task --quiet build:fast",
    opts = require "configs.peek",
  },
  --]]

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    keys = {
      { "<leader>mp", "<cmd>MarkdownPreview<cr>", desc = "markdown preview" },
    },
    build = function()
      require("lazy").load { plugins = { "markdown-preview.nvim" } }
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
    opts = require "configs.copilot",
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
    opts = require "configs.copilotchat",
  },

  {
    "eandrju/cellular-automaton.nvim",
    keys = {
      { "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>", desc = "random make it rain" },
    },
  },
}
