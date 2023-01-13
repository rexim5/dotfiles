local Remap = require("rzksobhy27.map")
local nmap = Remap.nmap
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local xnoremap = Remap.xnoremap
local inoremap = Remap.inoremap
-- local cnoremap = Remap.cnoremap
local tnoremap = Remap.tnoremap

nnoremap("<leader>e", ":Ex<CR>")

-- navigate between windows
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-l>", "<C-w>l")

-- Resize window using <ctrl> arrow keys
pcall(vim.keymap.del, "n", "<C-Up>")
pcall(vim.keymap.del, "n", "<C-Down>")
pcall(vim.keymap.del, "n", "<C-Left>")
pcall(vim.keymap.del, "n", "<C-Right>")
nnoremap("<C-Up>", "<cmd>resize +2<CR>")
nnoremap("<C-Down>", "<cmd>resize -2<CR>")
nnoremap("<C-Left>", "<cmd>vertical resize -2<CR>")
nnoremap("<C-Right>", "<cmd>vertical resize +2<CR>")

-- tab keymaps
nnoremap("g]", ":tabnext<CR>")
nnoremap("g[", ":tabprevious<CR>")
nnoremap("gq", ":tabclose<CR>")

-- better indentation
vnoremap("<", "<gv")
vnoremap(">", ">gv")
nnoremap("<", "<<")
nnoremap(">", ">>")

-- move lines
nnoremap("<A-j>", ":m .+1<CR>==")
nnoremap("<A-k>", ":m .-2<CR>==")
vnoremap("<A-j>", ":m '>+1<CR>gv=gv")
vnoremap("<A-k>", ":m '<-2<CR>gv=gv")

nnoremap("Y", "yg$")

nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

-- better escape
inoremap("<C-c>", "<ESC>")
vnoremap("<C-c>", "<ESC>")
nnoremap("<C-c>", "<ESC>")
xnoremap("<C-c>", "<ESC>")

-- don't quit my editor
nmap("<C-z>", "<NOP>")

nmap("q:", "<NOP>")

xnoremap("<leader>p", '"_dP')

nnoremap("U", ":UndotreeToggle<CR>")
nnoremap("<leader>m", require("maximizer").toggle)
