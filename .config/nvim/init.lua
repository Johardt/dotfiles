require('config.lazy')

-- Basic options
vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.mouse = 'a'           -- Enable mouse support
vim.opt.clipboard = 'unnamedplus' -- Use system clipboard
vim.opt.breakindent = true    -- Enable break indent
vim.opt.undofile = true       -- Save undo history
vim.opt.ignorecase = true     -- Case insensitive searching
vim.opt.smartcase = true      -- Case sensitive if uppercase present
vim.opt.updatetime = 250      -- Decrease update time
vim.opt.timeoutlen = 300      -- Decrease timeout length
vim.opt.completeopt = 'menuone,noselect' -- Better completion experience

-- Tab options
vim.opt.tabstop = 4        -- Number of spaces tabs count for
vim.opt.shiftwidth = 4     -- Size of an indent
vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.softtabstop = 4    -- Number of spaces that a <Tab> counts for while performing editing operations

vim.cmd('colorscheme rose-pine')
