return {
    {
        'chomosuke/typst-preview.nvim',
        ft = 'typst',
        version = '1.*',
        opts = {
            open_cmd = "zen-beta --new-window %s",

            dependencies_bin = {
                ['tinymist'] = "tinymist",
            },
        }
    },
}
