require("CopilotChat").setup({
  -- model = "claude-3.7-sonnet",
  model = "claude-3.7-sonnet-thought",
  show_help = false,
  mappings = {
    complete = {
      insert = "<S-Tab>",
    },
  },
  window = {
    layout = "float",
    -- layout = "horizontal",
    width = 1,
    height = 0.95,
    border = "none",
    row = 0,
    zindex = 1,
  },
})

vim.keymap.set("n", "<leader>ct", "<cmd>CopilotChatToggle<CR>")
vim.keymap.set("n", "<leader>cl", "<cmd>CopilotChatReset<CR>")
vim.keymap.set("n", "<leader>cp", "<cmd>CopilotChatPrompts<CR>")
