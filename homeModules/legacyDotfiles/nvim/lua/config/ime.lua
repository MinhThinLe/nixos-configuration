local should_reenable_fcitx = false

local function is_fcitx_active()
    local output = io.popen("fcitx5-remote")
    -- Because the command above returns 2 if fcitx is active and 2 if it isn`t
    return tonumber(output:read("*all")) == 2
end

vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function()
        if is_fcitx_active() then
            vim.cmd("sil ! fcitx5-remote -c")
            should_reenable_fcitx = true
        else
            should_reenable_fcitx = false
        end
    end
})

vim.api.nvim_create_autocmd("InsertEnter", {
    callback = function()
        if should_reenable_fcitx then
            -- I have mispelt "fcitx" way too much
            vim.cmd("sil ! fcitx5-remote -o")
        end
    end
})
