return {
    { 'williamboman/mason.nvim', opts = {} },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'nvim-treesitter/nvim-treesitter', build = ":TSUpdate", branch = 'master' },
    { 'nvim-telescope/telescope.nvim', tag = '0.1.8', dependencies = { 'nvim-lua/plenary.nvim' } },
    { 'nvim-mini/mini.nvim', version = false },
    { 'nvim-tree/nvim-web-devicons' },
}
