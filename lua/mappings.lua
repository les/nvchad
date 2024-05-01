-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/mappings.lua

require "nvchad.mappings"

local map = vim.keymap.set

map("t", "<ESC><ESC>", "<C-\\><C-n>", { noremap = true, desc = "terminal normal mode" })

map("n", ";", ":", { desc = "general enter command mode" })

map("n", "<Leader><Leader>", "<Cmd>Telescope find_files<CR>", { desc = "telescope find files" })

map("n", "<Leader>e", "<Cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle file explorer" })

map("n", "<Leader>gc", "<Cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })

map("n", "<Leader>gf", "<Cmd>Telescope git_files<CR>", { desc = "telescope git find files" })

map("n", "<Leader>km", "<Cmd>Telescope keymaps<CR>", { desc = "telescope search key maps" })

map(
  "n",
  "<Leader>%s",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "general find and replace current word" }
)

map({ "n", "v" }, "<Leader>d", [[_d]], { desc = "registers send selection to black hole register" })
map("x", "<Leader>p", [[_dP]], { desc = "registers send selection to black hole register, then put" })

-- maintain cursor position when joining lines
map("n", "J", "mzJ`z")

-- no-op macro recording keys
vim.keymap.set("n", "q", "<nop>")
vim.keymap.set("n", "Q", "<nop>")
