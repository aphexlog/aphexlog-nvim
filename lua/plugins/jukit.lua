return {
  "luk400/vim-jukit",
  lazy = false,
  config = function()
    -- Default configuration
    vim.g.jukit_shell_cmd = "ipython3"
    vim.g.jukit_terminal = "kitty"
    vim.g.jukit_auto_output_hist = 0
    vim.g.jukit_use_tcomment = 0
  end,
}
