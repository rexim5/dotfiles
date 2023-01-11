local lsp = require("lspconfig")
local nnoremap = require("rzksobhy27.map").nnoremap

local def_opts = {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
}

local function setup(server, opts)
    opts = opts or {}

    opts = vim.tbl_deep_extend("keep", opts, def_opts)

    lsp[server].setup(opts)
end

setup("cmake")
setup("clangd", {
    cmd = {
        "clangd",
        "--index",
        "--background-index",
        "--suggest-missing-includes",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--completion-style=detailed",
        "--function-arg-placeholders",
    },
})

setup("rust_analyzer")
setup("pyright")
setup("gopls")
setup("tsserver")
setup("bashls")
setup("jsonls", {
    settings = {
        json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
        },
    },
})

setup("sumneko_lua", {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
})

local group = vim.api.nvim_create_augroup("LspAttach_group", { clear = true })
vim.api.nvim_create_autocmd("LspAttach", {
    group = group,
    callback = function(args)
        if not (args.data and args.data.client_id) then
            return
        end

        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        local bufopts = { buffer = bufnr }
        nnoremap("K", vim.lsp.buf.hover, bufopts)
        nnoremap("gd", vim.lsp.buf.definition, bufopts)
        nnoremap("gr", vim.lsp.buf.references, bufopts)
        nnoremap("<F2>", vim.lsp.buf.rename, bufopts)
        nnoremap("<leader>la", vim.lsp.buf.code_action, bufopts)
        nnoremap("<leader>ld", vim.diagnostic.open_float, bufopts)
        nnoremap("<leader>lf", vim.lsp.buf.format)

        require("lsp-inlayhints").on_attach(client, bufnr, false)
    end,
})
