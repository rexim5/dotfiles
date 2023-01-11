local builtin = require("telescope.builtin")
local nnoremap = require("rzksobhy27.map").nnoremap

nnoremap("<leader>pf", builtin.find_files)

nnoremap("<leader>ps", function()
    builtin.grep_string({ search = vim.fn.input("Grep For > ") })
end)

nnoremap("<leader>pw", function()
    builtin.grep_string({ search = vim.fn.expand("<cword>") })
end)

nnoremap("<leader>pW", function()
    builtin.grep_string({ search = vim.fn.expand("<cWORD>") })
end)

nnoremap("<leader>pb", builtin.buffers)
