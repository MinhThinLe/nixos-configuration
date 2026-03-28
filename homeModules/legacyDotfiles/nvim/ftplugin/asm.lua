vim.opt_local.expandtab = false

vim.lsp.config.asm_lsp = {
    cmd = { "asm-lsp" },
    root_markers = { ".asl-lsp.toml" },
    filetypes = { "asm" }
}

vim.lsp.enable("asm_lsp")
