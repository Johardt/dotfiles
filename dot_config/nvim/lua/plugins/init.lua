return {
  {
    "stevearc/conform.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "github/copilot.vim",
    event = "InsertEnter",
    cmd = { "Copilot", "Copilot enable", "Copilot disable" },
    init = function()
      -- Avoid Copilot mapping <Tab> (often conflicts with completion engines)
      vim.g.copilot_no_tab_map = true
    end,
    config = function()
      -- Simple accept mapping; loaded only after plugin is available
      vim.keymap.set("i", "<C-l>", 'copilot#Accept("<CR>")', { silent = true, expr = true, desc = "Copilot accept" })
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
