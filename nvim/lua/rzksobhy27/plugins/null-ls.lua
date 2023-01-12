local null_ls = require("null-ls")
local nnoremap = require("rzksobhy27.map").nnoremap

local formatting = null_ls.builtins.formatting
-- local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    on_attach = function(_, bufnr)
        pcall(vim.api.nvim_buf_del_keymap, bufnr, "n", "<leader>lf")
        nnoremap("<leader>lf", function()
            vim.lsp.buf.format({
                filter = function(client)
                    return client.name == "null-ls"
                end,
                bufnr = bufnr,
            })
        end, { buffer = bufnr })
    end,
    sources = {
        formatting.stylua,
        formatting.black,
        formatting.prettier,
        formatting.gofmt,
        formatting.goimports,
    },
})
