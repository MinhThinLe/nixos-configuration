return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            options = {
                theme = "gruvbox",
                section_separators = '',
                component_separators = '|',
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = { 'filename' },
                lualine_x = { 'encoding', 'fileformat', 'lsp_status', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
        }
    },
    {
        'nanozuki/tabby.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            preset = 'tab_only',
            lualine_theme = "gruvbox",
            nerdfont = true,
        },
    }
}
