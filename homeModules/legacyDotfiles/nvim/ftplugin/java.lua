vim.lsp.config.jdtls = {
    cmd = { "jdtls" },
    filetypes = { "java" }
}
vim.lsp.enable("jdtls")

require('nvim-treesitter').install({
    'java'
})
vim.treesitter.start()
