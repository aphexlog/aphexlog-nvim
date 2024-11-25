-- Lets go ahead and configure copilot for neovim, this is the copilot.lua file
return {
  "zbirenbaum/copilot.lua",

  config = function()
    require("copilot").setup()

    filetypes = {
      "typescript",
      "javascript",
      "typescriptreact",
      "javascriptreact",
      "lua",
      "json",
      "yaml",
      "html",
      "css",
      "scss",
      "markdown",
      "vim",
    }
  end,
}
