local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local cmp = require('cmp')
cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' }
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<ESC>'] = cmp.mapping.abort(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
        ['<Tab>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
    },
    snippet = {
        expand = function(args)
            local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
            insert({ body = args.body }) -- Insert at cursor
            cmp.resubscribe({ "TextChangedI", "TextChangedP" })
            require("cmp.config").set_onetime({ sources = {} })
        end,
    },
})

local pipepath = vim.fn.stdpath("cache") .. "/server.pipe"
if not vim.loop.fs_stat(pipepath) then
    vim.fn.serverstart(pipepath)
end

vim.diagnostic.config({
    virtual_text = true,
})

vim.lsp.config("*", {
    root_marker = { ".git" }
})
