local nnoremap = require("rzksobhy27.map").nnoremap

local group = vim.api.nvim_create_augroup("LspAttach_group", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
    group = group,
    callback = function(args)
        if not (args.data and args.data.client_id) then
            return
        end

        local bufnr = args.buf

        local bufopts = { buffer = bufnr }
        nnoremap("K", vim.lsp.buf.hover, bufopts)
        nnoremap("<C-k>", vim.lsp.buf.signature_help, bufopts)
        nnoremap("gd", vim.lsp.buf.definition, bufopts)
        nnoremap("gr", vim.lsp.buf.references, bufopts)
        nnoremap("gi", vim.lsp.buf.implementation, bufopts)
        nnoremap("<leader>lr", vim.lsp.buf.rename, bufopts)
        nnoremap("<leader>la", vim.lsp.buf.code_action, bufopts)
        nnoremap("<leader>ld", vim.diagnostic.open_float, bufopts)
        nnoremap("<leader>lf", vim.lsp.buf.format)
        nnoremap("]d", vim.diagnostic.goto_next)
        nnoremap("[d", vim.diagnostic.goto_prev)
    end,
})
