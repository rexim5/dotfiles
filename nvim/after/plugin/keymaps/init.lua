local Remap = require("rzksobhy27.map")
local nmap = Remap.nmap
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local xnoremap = Remap.xnoremap
local inoremap = Remap.inoremap
-- local cnoremap = Remap.cnoremap
-- local tnoremap = Remap.tnoremap

nnoremap("<leader>e", ":Ex<CR>")

-- tab keymaps
nnoremap("]g", ":tabnext<CR>")
nnoremap("[g", ":tabprevious<CR>")
nnoremap("gq", ":tabclose<CR>")

-- better indentation
vnoremap("<", "<gv")
vnoremap(">", ">gv")

-- move lines
vnoremap("<A-j>", ":m '>+1<CR>gv=gv")
vnoremap("<A-k>", ":m '<-2<CR>gv=gv")

nnoremap("Y", "yg$")

-- stay at the center
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

-- better escape
inoremap("<C-c>", "<ESC>")
vnoremap("<C-c>", "<ESC>")
nnoremap("<C-c>", "<ESC>")
xnoremap("<C-c>", "<ESC>")

-- don't quit my editor
nmap("<C-z>", "<NOP>")

-- the most annoying feature of vim
-- and there is no way to disable it
nmap("q:", "<NOP>")

-- replace without changing current thing on the clipboard
xnoremap("<leader>p", '"_dP')

nnoremap("<leader>m", require("maximizer").toggle)
