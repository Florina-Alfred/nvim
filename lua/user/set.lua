-- vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
-- Create a cross-platform compatible path for undodir
local home = os.getenv("HOME")
-- On Windows, use USERPROFILE if HOME is not available
if not home then
    home = os.getenv("USERPROFILE")
end
-- Use proper path separator based on OS
local path_separator = package.config:sub(1, 1) -- Gets '/' on Unix and '\' on Windows
vim.opt.undodir = home .. path_separator .. ".vim" .. path_separator .. "undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- vim.opt.colorcolumn = "80"
