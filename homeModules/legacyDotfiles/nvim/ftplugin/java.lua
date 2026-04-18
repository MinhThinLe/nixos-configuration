vim.lsp.config.jdtls = {
    cmd = { "jdtls" },
    root_markers = { "justfile", ".gitignore" },
    filetypes = { "java" }
}
vim.lsp.enable("jdtls")

require('nvim-treesitter').install({
    'java'
})
vim.treesitter.start()
