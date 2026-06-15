return {
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp', dependencies = { "abeldekat/cmp-mini-snippets" } },
    { 'nvim-treesitter/nvim-treesitter', lazy = false, build = ":TSUpdate" },
    { 'nvim-telescope/telescope.nvim', version = '*', dependencies = { 'nvim-lua/plenary.nvim', } },
    { 'nvim-mini/mini.nvim', version = false },
    { 'nvim-tree/nvim-web-devicons' },
}
