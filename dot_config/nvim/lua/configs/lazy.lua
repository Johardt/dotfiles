return {
  defaults = { lazy = true },
  install = { colorscheme = { "nvchad" } },

  ui = {
    icons = {
      ft = "",
      lazy = "󰂠 ",
      loaded = "",
      not_loaded = "",
    },
  },

  performance = {
    rtp = {
      -- Keep this list minimal; disabling core pieces (syntax, ftplugin, etc.) can break plugins.
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
        -- netrw is often disabled when using alternative file explorers; NvChad uses others.
        "netrwPlugin",
      },
    },
  },
}
