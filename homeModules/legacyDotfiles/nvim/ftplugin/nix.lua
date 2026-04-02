vim.lsp.config.nil_ls = {
    cmd = { "nil" },
    filetypes = { "nix" }
}
vim.lsp.enable("nil_ls")

require('nvim-treesitter').install({
    'nix'
})
vim.treesitter.start()
