-- https://github.com/zbirenbaum/copilot.lua

local options = {
  panel = {
    auto_refresh = true,
    layout = {
      position = "right",
      ratio = 0.5,
    },
  },

  suggestion = {
    auto_trigger = true,
    hide_during_completion = false,
  },

  filetypes = {
    go = true,
    sh = true,
    ["*"] = false,
  },
}

require("copilot").setup(options)
