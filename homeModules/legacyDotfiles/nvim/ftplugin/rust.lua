vim.lsp.config.rust_analyzer = {
    cmd = { "rust-analyzer" },
    root_markers = { "Cargo.toml", "Cargo.lock" },
    filetypes = { "rust" }
}
vim.lsp.enable("rust_analyzer")

require('nvim-treesitter').install({
    'rust'
})
vim.treesitter.start()
