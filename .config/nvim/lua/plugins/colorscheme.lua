return {
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        opts = {dark_variant = 'main'}
    },
    {'navarasu/onedark.nvim', name = 'onedark'},
    { "catppuccin/nvim", name = "catppuccin", priority = 1000, 
        opts = {
            flavour = "auto",
            background = {
                light = "latte",
                dark = "frappe",
            },
        }
    } 
}
