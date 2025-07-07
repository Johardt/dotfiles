if vim.loader then vim.loader.enable() end

require("config.lazy")
vim.o.termguicolors = true

-- Setup theme detection and colorscheme
require("theme").setup()

-- Load keymaps
require("config.keymaps")
