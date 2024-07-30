local Plugin = {'kyazdani42/nvim-tree.lua'}

Plugin.lazy = false

Plugin.dependencies = {
    'kyazdani42/nvim-web-devicons'
}

Plugin.opts = {}

function Plugin.init()
    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', opts)
    vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<CR>', opts)
    vim.keymap.set('n', '<leader>r', ':NvimTreeRefresh<CR>', opts)
    vim.keymap.set('n', '<leader>n', ':NvimTreeFindFile<CR>', opts)
end

return Plugin
