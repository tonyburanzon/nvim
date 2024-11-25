vim.keymap.set("n", "<leader>pv", "<cmd>Ex<CR>")
vim.keymap.set("n", "<leader>o", "<C-o>")
vim.keymap.set("n", "<leader>l", "<C-l>")
vim.keymap.set("n", "<leader>]", "<C-]>")
vim.keymap.set("n", "<leader>lsr", ":LspRestart<CR>")

vim.keymap.set("n", "<leader>%", ":vsp<CR>")
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

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("i", "<C-n>", "<nop>")
