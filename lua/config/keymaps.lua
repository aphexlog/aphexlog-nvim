local map = LazyVim.safe_keymap_set

-- Telescope keymaps
map("n", "<leader>t", "Telescope", { noremap = true, silent = true }) -- This just provides a readable header
map("n", "<leader>tt", ":TodoTelescope<CR>", { noremap = true, silent = true })
map("n", "<leader>tf", ":Telescope find_files<CR>", { noremap = true, silent = true })
map("n", "<leader>tg", ":Telescope live_grep<CR>", { noremap = true, silent = true })
map("n", "<leader>tb", ":Telescope buffers<CR>", { noremap = true, silent = true })

-- Copilot keymaps
map("n", "<leader>cp", "Copilot", { noremap = true, silent = true }) -- This just provides a readable header
map("n", "<leader>cpc", ":CopilotChatToggle<CR>", { noremap = true, silent = true })
map("n", "<leader>cps", ":CopilotChatSave<CR>", { noremap = true, silent = true })
map("n", "<leader>cpp", ":CopilotPanel<CR>", { noremap = true, silent = true })
