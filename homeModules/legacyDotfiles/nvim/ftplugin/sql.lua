vim.lsp.config.sqls = {
    cmd = { "sqls" },
    filetypes = { "sql" }
}
vim.lsp.enable("sqls")

require('nvim-treesitter').install({
    'sql'
})
vim.treesitter.start()
