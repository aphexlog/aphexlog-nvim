return {
  "zbirenbaum/copilot.lua",
  config = function()
    local copilot = require("copilot")
    
    copilot.setup({
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
      filetypes = {
        yaml = true,
        markdown = true,
        help = true,
        gitcommit = true,
        gitrebase = true,
        hgcommit = true,
        svn = true,
        cvs = true,
        ["."] = true,
      },
    })

    -- Add commands to enable/disable Copilot suggestions
    vim.api.nvim_create_user_command("CopilotDisable", function()
      copilot.suggestion.toggle_auto_trigger()
    end, {})
    
    vim.api.nvim_create_user_command("CopilotEnable", function()
      copilot.suggestion.toggle_auto_trigger()
    end, {})
  end,
}
