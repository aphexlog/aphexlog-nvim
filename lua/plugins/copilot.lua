-- Lets go ahead and configure copilot for neovim, this is the copilot.lua file
return {
  "zbirenbaum/copilot.lua",

  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = true,
        debounce = 75,
        keymap = {
          accept = "<C-M-j>", -- Accept suggestion (downward logic)
          accept_word = "<C-M-k>", -- Accept word (upward logic)
          accept_line = "<C-M-l>", -- Accept line (rightward logic)
          next = "<C-M-n>", -- Navigate to next suggestion
          prev = "<C-M-p>", -- Navigate to previous suggestion
          dismiss = "<C-M-h>", -- Dismiss suggestion (leftward logic)
        },
      },
      panel = {
        enabled = true,
        auto_refresh = true,
        keymap = {
          toggle = "<C-M-m>", -- Toggle Copilot panel
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
  end,
}
