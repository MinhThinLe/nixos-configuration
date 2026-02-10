local function get_current_line()
    local position = vim.api.nvim_win_get_cursor(0)
    local row, column = unpack(position)
    local current_line = vim.api.nvim_buf_get_lines(0, row - 1, row, true)
    return current_line[1]
end

-- A link is defined to be the text enclosed within a set of parenthesis like
-- the one in a markdown document
local function get_link(line)
    local LINK_START = '('
    local LINK_END = ')'
    local link_start_index, _ = string.find(line, LINK_START, 1, true)
    local link_end_index, _ = string.find(line, LINK_END, 1, true)

    if link_start_index == nil or link_end_index == nil then
        return ""
    end

    if link_start_index > link_end_index then
        return ""
    end

    return string.sub(line, link_start_index + 1, link_end_index - 1)
end

local function jump_to_link()
    local line = get_current_line()
    local link = get_link(line)
    if string.len(link) == 0 then
        return
    end
    vim.cmd('e ' .. link)
end

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'markdown' },
    callback = function() vim.keymap.set('n', '<leader>gf', jump_to_link) end,
})
