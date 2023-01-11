local dap = require("dap")
local dapui = require("dapui")
local dapvt = require("nvim-dap-virtual-text")

local nnoremap = require("rzksobhy27.map").nnoremap

dap.listeners.after.event_initialized["rzksobhy27"] = function()
    -- terminate dap
    nnoremap("<F1>", dap.terminate)

    -- toggle dapui
    nnoremap("<F4>", dapui.toggle)

    -- dap keymaps
    nnoremap("<F10>", dap.step_over)
    nnoremap("<F11>", dap.step_into)
    nnoremap("<F12>", dap.step_out)

    dapvt.enable()
end

local function shutdown()
    -- delete keymaps
    pcall(vim.keymap.del, "n", "<F1>")
    pcall(vim.keymap.del, "n", "<F4>")
    pcall(vim.keymap.del, "n", "<F10>")
    pcall(vim.keymap.del, "n", "<F11>")
    pcall(vim.keymap.del, "n", "<F12>")

    dapui.close({})
    dapvt.disable()
end

dap.listeners.after.event_terminated["rzksobhy27"] = shutdown
dap.listeners.after.event_exited["rzksobhy27"] = shutdown

nnoremap("<F5>", dap.continue)
nnoremap("<F9>", dap.toggle_breakpoint)

dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
        command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
        args = { "--port", "${port}" },
    },
}

dap.configurations.c = {
    {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
    },
}

dap.configurations.cpp = dap.configurations.c
dap.configurations.rust = dap.configurations.cpp
