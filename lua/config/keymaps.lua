-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local map = LazyVim.safe_keymap_set

-- create a keymap to run the following command :TodoTelescope

map("n", "<leader>tt", ":TodoTelescope<CR>", { noremap = true, silent = true })
