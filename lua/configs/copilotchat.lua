-- https://github.com/CopilotC-Nvim/CopilotChat.nvim

local options = {
  -- Default context to use, 'buffers', 'buffer' or none (can be specified
  -- manually in prompt via @).
  context = "buffer",
  history_path = vim.fn.stdpath "data" .. "/copilotchat_history",
}

require("CopilotChat").setup(options)
