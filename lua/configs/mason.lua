-- https://github.com/williamboman/mason.nvim

--[[
vim.api.nvim_create_user_command("MasonInstallAll", function()
  vim.cmd("MasonInstall " .. table.concat(options.ensure_installed, " "))
end, {})
--]]

local options = {
  ensure_installed = {
    "markuplint",
  },
}

return options
