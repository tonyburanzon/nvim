vim.opt.guicursor = ""

vim.opt.nu = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
--vim.opt.undodir = os.getenv("XDG_CACHE_HOME") .. "/.vim/undodir//"
--vim.g.netrw_home = os.getenv("XDG_CACHE_HOME") .. "/.vim/netrw//"

vim.opt.scrolloff = 8

vim.g.mapleader = " "
vim.opt.signcolumn = 'yes'


vim.opt.mouse = ""

-- Netrw things
-- Open files in current window/ all one window.
vim.g.netrw_browse_split = 0
-- Set netrw to tree listing style by default
vim.g.netrw_liststyle = 3
-- Remove the banner at the top
vim.g.netrw_banner = 0
-- Set the width of the netrw window
vim.g.netrw_winsize = 25
