-- https://github.com/toppair/peek.nvim

local peek = require "peek"

vim.api.nvim_create_user_command("MarkdownPreview", function()
  if peek.is_open() then
    peek.close()
  else
    peek.open()
  end
end, {})

vim.keymap.set("n", "<Leader>mp", "<Cmd>MarkdownPreview<CR>", { desc = "markdown preview" })

local options = {
  auto_load = true, -- Load new preview when switching between Markdown buffers
  close_on_bdelete = true,
  syntax = true,
  theme = "light",
  update_on_change = true,
  app = "firefox",
  filetype = { "markdown" },
}

peek.setup(options)
