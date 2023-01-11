require("rzksobhy27.plugins.telescope")
require("rzksobhy27.plugins.treesitter")
require("rzksobhy27.plugins.cmp")
require("rzksobhy27.plugins.mason")
require("rzksobhy27.plugins.null-ls")

require("Comment").setup()
require("fidget").setup()
require("lsp-inlayhints").setup({
    inlay_hints = {
        highlight = "Comment",
    },
})
