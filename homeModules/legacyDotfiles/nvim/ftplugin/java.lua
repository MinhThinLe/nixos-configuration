local home = os.getenv("HOME")
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = home .. '/.nvim-jdtls/' .. project_name

vim.lsp.config.jdtls = {
    cmd = { "jdtls", "-data", workspace_dir },
    root_markers = { "justfile", ".gitignore" },
    filetypes = { "java" },
}
vim.lsp.enable("jdtls")

require('nvim-treesitter').install({
    'java'
})
vim.treesitter.start()
