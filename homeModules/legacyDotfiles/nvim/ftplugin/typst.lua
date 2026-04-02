vim.lsp.config.tinymist = {
    cmd = { "tinymist" },
    filetypes = { "typst" },
}
vim.lsp.enable("tinymist")

require('nvim-treesitter').install({
    'typst'
})
vim.treesitter.start()
