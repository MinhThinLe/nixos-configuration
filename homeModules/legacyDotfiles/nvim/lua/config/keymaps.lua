local set_map = vim.keymap.set
local builtin = require('telescope.builtin')

vim.g.mapleader = ' '
set_map('n', '<leader>ff', builtin.find_files, {})
set_map('n', '<leader>fg', builtin.live_grep, {})
set_map('n', '<leader>ss', builtin.spell_suggest, {})
set_map('n', '<leader>ds', builtin.lsp_document_symbols, {})
set_map('n', '<leader>fd', builtin.diagnostics, {})
set_map('n', '<leader>fb', builtin.buffers, {})

set_map('n', '<leader>w', ':w<CR>')
set_map('n', '<leader>q', ':q<CR>')
set_map('n', '<leader>cs', ':noh<CR>')
set_map('n', '<leader><leader>', '<C-W><C-W>')
set_map('n', '<leader>t', ':tabnew<CR>')
set_map('n', '<leader>l', ':tabnext<CR>')
set_map('n', '<leader>h', ':tabprevious<CR>')
set_map('n', '<leader>fe', ':lua MiniFiles.open()<CR>')
set_map('t', '<Esc>', '<C-\\><C-n>')
set_map('i', '<C-BS>', '<ESC>bdwi') -- Ctrl backspace bind
set_map('n', '<leader>bb', ':b#<CR>')


vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('user_lsp_attach', { clear = true }),
    callback = function(event)
        local opts = { buffer = event.buf }

        set_map('n', 'gd', function() vim.lsp.buf.definition() end, opts)
        set_map('n', 'K', function() vim.lsp.buf.hover() end, opts)
        set_map('n', '<leader>j', function() vim.diagnostic.goto_next() end, opts)
        set_map('n', '<leader>k', function() vim.diagnostic.goto_prev() end, opts)
        set_map('n', '<leader>o', function() vim.diagnostic.open_float() end, opts)
        set_map('n', '<leader>ca', function() vim.lsp.buf.code_action() end, opts)
        set_map('n', '<leader>rf', function() vim.lsp.buf.references() end, opts)
        set_map('n', '<leader>rn', function() vim.lsp.buf.rename() end, opts)
        set_map('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
    end,
})
