-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "everforest_light",
  theme_toggle = { "everforest_light", "everforest" },
}

M.ui = {
  statusline = {
    theme = "vscode_colored",
  },
}

return M
