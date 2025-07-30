vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", "<cmd>Oil<CR>")

-- remap number increment/decrement to Ctrl+k and Ctrl+j
vim.keymap.set("n", "<C-l>", "<C-a>")
vim.keymap.set("n", "<C-h>", "<C-x>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste without yanking
vim.keymap.set("x", "<leader>p", [["_dP]])

-- copy to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- write to save
vim.keymap.set({ "n", "v", "i" }, "<C-s>", "<ESC>:w<CR>")

vim.keymap.set("i", "<C-c>", "<Esc>")
-- vim.keymap.set("i", "jk", "<Esc>")

vim.keymap.set("n", "fj", "}<Down>")
vim.keymap.set("n", "fk", "{<Up>")

vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-l>", "<Right>")
vim.keymap.set("i", "<C-o>", "<C-o>$")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
