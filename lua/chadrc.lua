-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

<<<<<<< HEAD
M.ui = {
  theme = "everforest_light",
  theme_toggle = { "everforest_light", "everforest" },
||||||| aad6242
M.ui = {
	theme = "onedark",
=======
M.base46 = {
	theme = "onedark",
>>>>>>> upstream/main

  statusline = {
    theme = "vscode_colored",
  },
}

return M
