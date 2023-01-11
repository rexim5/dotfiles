local M = {}

local function restore()
    local wins = vim.api.nvim_tabpage_list_wins(0)

    for _, win in ipairs(wins) do
        local has_width, width = pcall(vim.api.nvim_win_get_var, win, "maximizer_width")
        local has_height, height = pcall(vim.api.nvim_win_get_var, win, "maximizer_height")

        if has_width and has_height then
            vim.api.nvim_win_set_width(win, width)
            vim.api.nvim_win_set_height(win, height)
        end
    end

    vim.t.maximizer_maximized = false
end

local function maximize()
    local wins = vim.api.nvim_tabpage_list_wins(0)

    for _, win in ipairs(wins) do
        local width = vim.api.nvim_win_get_width(win)
        local height = vim.api.nvim_win_get_height(win)

        vim.api.nvim_win_set_var(win, "maximizer_width", width)
        vim.api.nvim_win_set_var(win, "maximizer_height", height)
    end

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
