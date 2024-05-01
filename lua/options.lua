-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/options.lua

require "nvchad.options"

local opt = vim.opt

opt.clipboard:append { "unnamed", "unnamedplus" }
opt.colorcolumn = "80"
opt.guicursor = ""
opt.linebreak = true
opt.relativenumber = true
opt.scrolloff = 5
opt.spell = true
opt.spelllang = "en_gb"
