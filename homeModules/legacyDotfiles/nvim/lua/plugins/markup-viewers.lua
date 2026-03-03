return {
    {
        'chomosuke/typst-preview.nvim',
        ft = 'typst',
        version = '1.*',
        opts = {
            open_cmd = "chromium --new-window %s",

            dependencies_bin = {
                ['tinymist'] = "tinymist",
            },
        }
    },
}
