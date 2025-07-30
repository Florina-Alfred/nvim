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
-- vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- vim.opt.colorcolumn = "80"

vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('HighlightYank', {}),
    callback = function()
        vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 200 })
    end,
})

if vim.lsp.inlay_hint then
    vim.lsp.inlay_hint.enable(true, { 0 })
end

local virtual_lines_enabled = true
function _G.toggle_virtual_lines()
    virtual_lines_enabled = not virtual_lines_enabled
    vim.diagnostic.config({ virtual_lines = virtual_lines_enabled })
end

vim.keymap.set('n', '<leader>vl', _G.toggle_virtual_lines, { desc = 'Toggle virtual_lines diagnostics' })

local virtual_text_enabled = true
function _G.toggle_virtual_text()
    virtual_text_enabled = not virtual_text_enabled
    vim.diagnostic.config({ virtual_text = virtual_text_enabled })
end

vim.keymap.set('n', '<leader>vt', _G.toggle_virtual_text, { desc = 'Toggle virtual_text diagnostics' })
