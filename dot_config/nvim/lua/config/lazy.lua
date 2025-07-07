-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


require("lazy").setup({
  -- Theme based on terminal background
  {
    "nomis51/nvim-xcode-theme",
    lazy = false,
    priority = 1000,
  },

  -- Treesitter for syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      highlight = { enable = true },
      auto_install = true,
    },
  },

  -- TypeScript tools (replaces deprecated tsserver)
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("typescript-tools").setup({})
    end,
  },

  -- LSP with automatic setup
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local servers = {
        "pyright", "lua_ls", "rust_analyzer", "gopls", -- Add more as needed
      }

      for _, lsp in ipairs(servers) do
        local ok, _ = pcall(lspconfig[lsp].setup, {})
        if not ok then
          vim.notify("LSP " .. lsp .. " not found", vim.log.levels.WARN)
        end
      end
    end,
  },

  -- File explorer
  { 
    "nvim-tree/nvim-tree.lua", 
    opts = { 
      view = { width = 30 },
      renderer = {
        highlight_git = true,
        icons = {
          show = {
            git = true,
          },
        },
      },
    },
  },

  -- Which-key popup
  { "folke/which-key.nvim", opts = {} },

  -- FZF Lua
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
})
