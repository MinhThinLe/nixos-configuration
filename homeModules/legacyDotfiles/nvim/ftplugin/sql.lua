vim.lsp.config.sqls = {
    cmd = { "sqls" },
    filetypes = { "sql" },
    root_markers = { "flake.nix" }
}
vim.lsp.enable("sqls")

require('nvim-treesitter').install({
    'sql'
})
vim.treesitter.start()
