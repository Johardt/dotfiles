-- Keymaps configuration

-- File explorer
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })

-- FZF Lua
vim.keymap.set("n", "<leader>ff", require("fzf-lua").files, { desc = "Find Files" })
