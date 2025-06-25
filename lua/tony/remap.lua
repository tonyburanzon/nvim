vim.keymap.set("n", "<leader>pv", "<cmd>Ex<CR>")
vim.keymap.set("n", "<leader>o", "<C-o>")
vim.keymap.set("n", "<leader>i", "<C-i>")
vim.keymap.set("n", "<leader>rlsp", "<cmd>LspRestart<CR>")

vim.keymap.set("n", "<leader>%", "<cmd>vsp<CR>")
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>l", "<C-w>l")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>[", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>]", "<cmd>cprev<CR>zz")

vim.keymap.set("n", "Q", "<nop>")
-- Disable vims built in auto in favor of nvim-cmp
vim.keymap.set("i", "<C-n>", "<nop>")
