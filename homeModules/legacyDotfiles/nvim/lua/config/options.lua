vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.scrolloff = 8
vim.opt.splitright = true

vim.cmd("language en_US.utf8")

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'markdown' },
    callback = function() vim.treesitter.start() end,
})

require("mini.pairs").setup()
require("mini.basics").setup()
require("mini.snippets").setup({
    snippets = {
        require("mini.snippets").gen_loader.from_lang(),
    }
})
require("mini.files").setup({
    windows = {
        preview = true,
        width_preview = 50,
    }
})
require("mini.surround").setup({
    mappings = {
        add = '<leader>sa',
        delete = '<leader>sd',
        find = '<leader>sf',
        find_left = '<leader>sF',
        highlight = '<leader>sh',
        replace = '<leader>sr',
    }
})

local map_split = function(buf_id, lhs, direction)
  local rhs = function()
    -- Make new window and set it as target
    local cur_target = MiniFiles.get_explorer_state().target_window
    local new_target = vim.api.nvim_win_call(cur_target, function()
      vim.cmd(direction .. ' split')
      return vim.api.nvim_get_current_win()
    end)

    MiniFiles.set_target_window(new_target)

    -- This intentionally doesn't act on file under cursor in favor of
    -- explicit "go in" action (`l` / `L`). To immediately open file,
    -- add appropriate `MiniFiles.go_in()` call instead of this comment.
    MiniFiles.go_in({ close_on_file = true })
  end

  -- Adding `desc` will result into `show_help` entries
  local desc = 'Split ' .. direction
  vim.keymap.set('n', lhs, rhs, { buffer = buf_id, desc = desc })
end

vim.api.nvim_create_autocmd('User', {
  pattern = 'MiniFilesBufferCreate',
  callback = function(args)
    local buf_id = args.data.buf_id
    -- Tweak keys to your liking
    map_split(buf_id, '<C-s>', 'below horizontal')
    map_split(buf_id, '<C-v>', 'below vertical')
    map_split(buf_id, '<C-t>', 'tab')
  end,
})
