local M = {}

local function restore()
    vim.cmd.wincmd("=")
    vim.t.maximizer_maximized = false
end

local function maximize()
    vim.api.nvim_win_set_width(0, 10000)
    vim.api.nvim_win_set_height(0, 10000)

    vim.t.maximizer_maximized = true
end

function M.toggle()
    if vim.t.maximizer_maximized then
        restore()
    else
        maximize()
    end
end

local group = vim.api.nvim_create_augroup("maximizer", { clear = true })
vim.api.nvim_create_autocmd({ "WinLeave", "WinNew" }, {
    group = group,
    callback = function()
        if vim.t.maximizer_maximized then
            restore()
        end
    end,
})

return M
