-- Shared function to format Go files using gofmt
local function format_with_gofmt()
    -- Run gofmt and reload the buffer to reflect changes
    vim.cmd("silent! execute '!gofmt -w %'")
    vim.cmd("checktime") -- Reload the buffer only if the file changed
end

-- Autoformat on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = format_with_gofmt,
})

-- Use gofmt for = commands
vim.cmd("setlocal equalprg=gofmt")

-- Keymap for manual formatting
vim.keymap.set("n", "<leader>f", format_with_gofmt, { buffer = true, desc = "Format Go file with gofmt" })

-- Add Go-specific LSP settings
local lspconfig = require("lspconfig")
lspconfig.gopls.setup {
    settings = {
        gopls = {
            gofumpt = false, -- Use gofmt instead of stricter gofumpt
        },
    },
}
