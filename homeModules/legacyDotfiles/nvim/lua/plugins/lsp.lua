return {
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'nvim-treesitter/nvim-treesitter', lazy = false, build = ":TSUpdate" },
    { 'nvim-telescope/telescope.nvim', version = '*', dependencies = { 'nvim-lua/plenary.nvim', } },
    { 'nvim-mini/mini.nvim', version = false },
    { 'nvim-tree/nvim-web-devicons' },
}
