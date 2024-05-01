-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/autocmds.lua

require "nvchad.autocmds"

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("templates", { clear = true })

-- Read the content of matching skeleton into new buffer.
autocmd("BufNewFile", {
  group = "templates",
  pattern = "*.*",
  callback = function()
    local file_extension = vim.fn.expand "<afile>:e"
    local config_path = vim.fn.stdpath "config"
    local skeleton_path = string.format("%s/templates/skeleton.%s", config_path, file_extension)
    vim.cmd(string.format("silent! 0r %s", skeleton_path))
  end,
})

augroup("cursor", { clear = true })

-- Restore cursor position on buffer open.
autocmd("BufReadPost", {
  group = "cursor",
  pattern = "*",
  callback = function()
    local line = vim.fn.line "'\""
    if
      line > 1
      and line <= vim.fn.line "$"
      and vim.bo.filetype ~= "commit"
      and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
    then
      vim.cmd 'normal! g`"'
    end
  end,
})
