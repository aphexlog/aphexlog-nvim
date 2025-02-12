return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- Required for Copilot integration
      { "nvim-lua/plenary.nvim" }, -- For async functions
    },
    build = "make tiktoken", -- Only on macOS or Linux
    opts = {
      enabled = true,
      auto_trigger = true,
      language = "en-US",
      window = {
        layout = "float",
        relative = "editor",
        width = 0.8,
        height = 0.8,
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = false,
        debounce = 75,
        keymap = {
          accept = "<C-M-j>",
          accept_word = "<C-M-k>",
          accept_line = "<C-M-l>",
          next = "<C-M-n>",
          prev = "<C-M-p>",
          dismiss = "<C-M-h>",
        },
      },
      panel = {
        enabled = true,
        auto_refresh = true,
        keymap = {
          toggle = "<C-M-m>",
        },
      },
    },
    config = function(_, opts)
      -- Ensure UUID function is defined only if missing
      if vim.fn.executable("uuidgen") == 1 and not vim.uuid then
        vim.uuid = function()
          return vim.fn.system("uuidgen"):gsub("\n", "")
        end
      end

      -- Initialize CopilotChat
      local copilot_chat = require("CopilotChat")
      copilot_chat.setup(opts)

      -- Improved key mappings using `vim.keymap.set`
      local keymap = vim.keymap.set
      local opts = { expr = true, silent = true }

      keymap("i", "<C-M-j>", 'copilot#Accept("<CR>")', opts)
      keymap("i", "<C-M-k>", "copilot#AcceptWord()", opts)
      keymap("i", "<C-M-l>", "copilot#AcceptLine()", opts)
      keymap("i", "<C-M-n>", "copilot#Next()", opts)
      keymap("i", "<C-M-p>", "copilot#Previous()", opts)
      keymap("i", "<C-M-h>", "copilot#Dismiss()", opts)

      -- Keybinding to toggle CopilotChat
      keymap("n", "<C-M-m>", ":CopilotChatToggle<CR>", { noremap = true, silent = true })
    end,
  },
}
