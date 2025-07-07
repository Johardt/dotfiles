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
    config = function()
      -- Function to detect if system is in dark mode
      local function is_dark_mode()
        -- First try TERM_BACKGROUND environment variable
        local term_bg = vim.fn.getenv("TERM_BACKGROUND")
        if term_bg == "light" then
          return false
        elseif term_bg == "dark" then
          return true
        end
        
        -- Fallback: check macOS system appearance
        local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
        if handle then
          local result = handle:read("*a")
          handle:close()
          -- If AppleInterfaceStyle is "Dark", system is in dark mode
          -- If the command fails or returns empty, system is in light mode
          return result:match("Dark") ~= nil
        end
        
        -- Default to light mode if detection fails
        return false
      end
      
      if is_dark_mode() then
        vim.cmd.colorscheme("xcodedark")
      else
        vim.cmd.colorscheme("xcodelight")
      end
    end,
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

  -- LSP with automatic setup
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local servers = {
        "tsserver", "pyright", "lua_ls", "rust_analyzer", "gopls", -- Add more as needed
      }

      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({})
      end
    end,
  },

  -- File explorer
  { "nvim-tree/nvim-tree.lua", opts = {} },

  -- Which-key popup
  { "folke/which-key.nvim", opts = {} },

  -- FZF Lua
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
})
