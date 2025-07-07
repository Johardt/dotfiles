require("config.lazy")
vim.o.termguicolors = true
vim.o.background = vim.fn.getenv("TERM_BACKGROUND") == "light" and "light" or "dark"

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
vim.keymap.set("n", "<leader>ff", require("fzf-lua").files, { desc = "Find Files" })
